import { useState, useEffect } from 'react';
import { Grid } from '@mui/material';
import Card from '../components/Card';
import { getJupyterNotebookTitleBodyPairs, getPandasProfileReportTitleBodyPairs } from '../util/parse_jupyter_html';
import { CircularProgress } from '@mui/material';

export default () => {
    const [cards, setCards] = useState([]);
    const [loading, setLoading] = useState(true);

    //Set the data async
    useEffect(() =>
         getJupyterNotebookTitleBodyPairs("merge_n_interpolate.html")
            .then(res => {
                setCards(res)
                setLoading(false);
            })
        , [])

    return (
        <Grid container
            spacing={2}
            justifyContent="center"
        >
            {
                loading
                    ? <Grid item style={{ margin: "auto" }}>
                        <CircularProgress />
                    </Grid>
                    :
                    // Design your page from here
                    <>
                        {cards.map(p => (
                            <Grid item style={{ width: "100%" }}>
                                <Card align="left" heading={p.title} >
                                    {p.body}
                                </Card>
                            </Grid>
                        ))}
                    </>
            }
        </Grid>
    )
}