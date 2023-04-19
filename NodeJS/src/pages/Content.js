import { usePageContext } from '../PageContext';
import { Grid } from '@mui/material';

//Add pages from the Navigation bar here
import * as introduction_surface_water_quality from './introduction-surface_water_quality';
import * as introduction_engineering from './introduction-engineering';
import * as results_surface_water_notebook from './results-surface_water_notebook';
import * as results_interpolation_notebook from "./results-interpolation_notebook";
import * as results_preimpute_profile_report from "./results-pandas_full_preimpute";
import * as results_interpolate_profile_report from "./results-pandas_full_interpolate";
import * as results_interpolate_logs_profile_report from "./results-pandas_log_interpolate";
const pages = { introduction_surface_water_quality, introduction_engineering, results_surface_water_notebook, results_interpolate_profile_report, results_interpolate_logs_profile_report, results_interpolation_notebook, results_preimpute_profile_report};

export default () => {
  const [state, dispatch] = usePageContext();
  const { selectedNavigation, selectedSubnavigation } = state;

  //Convoluted..., but dynamic!
  var page = Object.entries(pages)
    .map(module => (typeof module[1]?.default === "function")
      ? [module[0], module[1]?.default()]
      : []
    )

  page = page.find(x =>
      x[0] === selectedNavigation + "_" + selectedSubnavigation.replaceAll(" ", "_")
    )?.[1];


  //Display page based on selected navigation
  return (
    <Grid container direction="column"
      sx={{ p: 3, minHeight: "calc(100vh - 80px)" }}
      spacing={2}
      justifyContent="center"
    >
      <Grid item style={{ maxWidth: "100%" }}>
        {page}
      </Grid>
    </Grid>
  )
}