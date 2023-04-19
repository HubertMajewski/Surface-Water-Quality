import { useState, useEffect } from 'react';
import { Grid } from '@mui/material';
import Card from '../components/Card';
import { getJupyterNotebookTitleBodyPairs } from '../util/parse_jupyter_html';
import { CircularProgress } from '@mui/material';

export default () => {
    const [cards, setCards] = useState([]);
    const [loading, setLoading] = useState(true);

    //Set the data async
    useEffect(() =>
        getJupyterNotebookTitleBodyPairs("Surfacewater_XGB.html")
            .then(res => {
                setCards(res)
                setLoading(false)
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
                        {cards.map(card => (
                            <Grid item style={{ width: "100%" }}>
                                <Card align="left" heading={card.title} >
                                    {card.body}
                                </Card>
                            </Grid>
                        ))}
                    </>
            }
        </Grid>
    )
}