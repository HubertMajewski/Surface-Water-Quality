import "../index.css";
import { PageContextProvider } from "../PageContext";
import Paperbase from "../Paperbase";

export default function App({ Component, pageProps }) {
    return (
        <PageContextProvider>
            <Paperbase />
        </PageContextProvider>
    );
}
