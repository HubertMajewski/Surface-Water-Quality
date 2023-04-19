import { useState, useEffect } from 'react';
import { Grid, Typography } from '@mui/material';
import Card from '../components/Card';
import { getJupyterNotebookTitleBodyPairs, getPandasProfileReportTitleBodyPairs } from '../util/parse_jupyter_html';
import { CircularProgress } from '@mui/material';

export default () => {
    const [loading, setLoading] = useState(true);

    //Set the data async
    useEffect(() => setLoading(false), [])

    return (
        <Grid container
            spacing={2}
            justifyContent="center"
            style={{
                width: "100%",
                "& h4": {
                    style: { margin: "auto" }
                },
                "& h5": {
                    style: { margin: "0" }
                },
            }}
        >
            {
                loading
                    ? <Grid item >
                        <CircularProgress />
                    </Grid>
                    :
                    // Design your page from here
                    <>
                        <Grid item>
                            <Card heading={<Typography variant="h4" align="center">
                                NeonScience.org
                            </Typography>}>
                                <p>
                                    NeonScience.org contains a repository of datasets maintained by the NSF.
                                    Of the many domains of datasets we could have chosen from this
                                    repository, we selected a group of datasets that would enable us to model surface water quality.
                                </p>
                            </Card>
                        </Grid>

                        <Grid item>
                            <Card heading={<Typography variant="h4" align="center">
                                Problems
                            </Typography>}>
                                The problems related to the dataset can be split into two categories:
                                <ol>
                                    <li>The Data</li>
                                    <li>The Database</li>
                                </ol>

                                <h5>The Data</h5>
                                <ol>
                                    <li>Data sets were too large to work within Excel.</li>
                                    <li>Data sets lacked and esablished relationship for purposes of modeling.</li>
                                    <li>Redundant independant variables for our purposes (metadata, sensors, etc.)</li>
                                </ol>

                                <h5>The Database</h5>
                                <ol>
                                    <li>Organize and mantain many seperate datasets.</li>
                                    <li>Needed to extract all valuable attributes relating to the mathematical model.</li>
                                </ol>
                            </Card>
                        </Grid>

                        <Grid item>
                            <Card heading={<Typography variant="h4" align="center">
                                Solution: Large Dataset
                            </Typography>}>
                                <p>The datasets varies in size and therefore so did the tables. The following are some examples of the dataset's sheer size: </p>
                                <ul>
                                    <li>Our rows for nitrate surface water data reached over two million. 45 Columns.</li>
                                    <li>Tempeture table had over 18.5 million rows. 39 Columns.</li>
                                    <li>Water Quality had 16.8 Million rows. 149 Columns.</li>
                                </ul>
                                <p>
                                    Having a proper database management system was crutial for selecting and organizing the data.
                                    We decided to move forward with PostgreSQL as an opensource and largely scalable solution to handle our data.
                                </p>
                                <p>
                                    Individual datasets were imported into their respective tables in PostgreSQL.
                                </p>
                            </Card>
                        </Grid>

                        <Grid item>
                            <Card heading={<Typography variant="h4" align="center">
                                Solution: Establishing Relationships
                            </Typography>}>
                                <>
                                    <p>
                                        Due to a lack of parent tables for the data sets.
                                        A parent-child relationship cannot be established.
                                    </p>
                                    <p>
                                        The datasets can be joined accordingly by their site columns and their date.
                                        The columns for each data set allowed for matching by a respective column matched the site id and a date.
                                    </p>
                                </>
                            </Card>
                        </Grid>

                        <Grid item>
                            <Card heading={<Typography variant="h4" align="center">
                                Solution: Remove redundant Columns
                            </Typography>}>
                                <p>The have a effective model, columns which contained data that pertains to sensor-device information,
                                    or metadata. This was to reduce the dimensionality issues that the dataset may introduce.
                                </p>

                                <p>
                                    Attributes that we believed may serve to be useful in identifying the quality of surface water were left alone.
                                    The attributes were also converted to their respective data types within PostgreSql for integrety.
                                </p>
                            </Card>
                        </Grid>

                        <Grid item>
                            <Card heading={<Typography variant='h4' align='center'>
                                Solution: PostgreSQL
                            </Typography>}>
                                <p>
                                    PostgreSQL provided an elegant wat to interact and view the data. 
                                    Select statement provided basic statistical methods of the dataset. 
                                    And in some cases, because the dataset was too large, it could not be 
                                    opened in a spreadsheet program like Microsoft Excel. 
                                </p>
                            </Card>
                        </Grid>

                        <Grid item>
                            <Card heading={<Typography variant='h4' align='center'>
                                Solution: Extraction of Relevant Data
                            </Typography>}>
                                <p>
                                    View were created to extract the wanted information that was mentioned in the above section.
                                    Python allowed a connection to a PostgreSQL Database to train the mathematical model.
                                </p>
                            </Card>
                        </Grid>

                    </>
            }
        </Grid >
    )
}