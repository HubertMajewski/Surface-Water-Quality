import axios from "axios";
import * as React from "react";
import { usePageContext } from "../PageContext";

const cleanupCell = (cell, idx) => {

	if (cell == null) return null;

	//Process individually
	if (Array.isArray(cell))
		return cell.map(c => cleanupCell(c))

	//Remove number from Notebook
	const elements = [...cell.getElementsByClassName("jp-InputPrompt"), ...cell.getElementsByClassName("jp-OutputPrompt")]
	elements.map(e => {
		if (idx !== null)
			e.parentNode.insertBefore(document.createTextNode(idx + ": "), e);
		e.parentNode.removeChild(e);
	})

	return cell;
}

const refreshScript = script => {
	if (!script?.parentNode) return;

	const newScript = document.createElement("script");

	[...script.attributes]
		.map(a => newScript.setAttribute(a.name, a.value));

	const scriptContent = document.createTextNode(script.innerHTML);
	newScript.appendChild(scriptContent);

	script.parentNode.replaceChild(newScript, script);
};

const WrapContent = ({ content, additionalScripts = [], styles = [] }) => {
	const [dispatch] = usePageContext()
	const ref = React.useRef(null)

	//DangerouslySetInnerHTML as base for forcePlots with a script in jupyter notebook
	const container = <div ref={ref} dangerouslySetInnerHTML={{ __html: content.innerHTML }} />

	React.useEffect(() => {
		if (!ref || !content) return;

		//Mount scripts to inner HTML
		[...ref.current.querySelectorAll("script")]
			.map(refreshScript);

		//Mount styles to inner HTML
		styles.map(
			styleElement => {
				document.body.appendChild(styleElement)
			}
		)
	}, [ref])

	return container;
}

export const getJupyterNotebookTitleBodyPairs = fileName =>
	axios.get("./" + "jupyter_html/" + fileName).then(response => {

		const doc = new DOMParser().parseFromString(response.data, "text/html");

		var Cell = [...doc.getElementsByClassName("jp-Cell")];

		return Cell.map((t, idx) => {

			var headding = cleanupCell([...t.getElementsByClassName("jp-InputArea")][0], idx);
			var body = cleanupCell([...t.getElementsByClassName("jp-OutputArea")][0], null);

			//Convert to JSX
			return ({
				title: headding ? <WrapContent content={headding} /> : null,
				body: body ? <WrapContent content={body} /> : null
			})
		});
	});

export const getPandasProfileReportTitleBodyPairs = fileName =>
	Promise.resolve([{
		title: <iframe src={"./" + "pandas_html/" + fileName} width={"100%"} height={"100%"}></iframe>
	}]
	);


export const getPDFTitleBodyPairs = fileName =>
	Promise.resolve([{
		title: <iframe src={"./" + "pdf/" + fileName} width={"100%"} height={"100%"}></iframe>
	}]
	);