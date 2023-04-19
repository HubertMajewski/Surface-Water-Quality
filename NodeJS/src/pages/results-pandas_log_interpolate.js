import { useState, useEffect } from 'react';
import { Grid } from '@mui/material';
import Card from '../components/Card';
import { getPandasProfileReportTitleBodyPairs } from '../util/parse_jupyter_html';
import { CircularProgress } from '@mui/material';

export default () => {
    const [cards, setCards] = useState([]);
    const [loading, setLoading] = useState(true);

    //Set the data async
    useEffect(() =>
            getPandasProfileReportTitleBodyPairs("logs_table_interpolate.html")
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
                        <Grid item width="100%" height="87vh">
                            {cards[0].title}
                        </Grid>
                    </>
            }
        </Grid>
    )
}