import { AppBar, Paper, Grid } from '@mui/material';

export const Card = ({ heading, children }) => {

  //Treat as array
  children = (Array.isArray(children) ? children : [children]);

  return <Paper>

    <AppBar
      position="static"
      color="default"
      elevation={0}
      sx={{ borderRadius: 1, borderBottom: '1px solid rgba(0, 0, 0, 0.12)', overflowX: "auto", ...(children[0] && children.length > 0 ? { borderBottomLeftRadius: 0, borderBottomRightRadius: 0 } : {}) }}
    >
      <Grid container>
        <Grid item xs sx={{ m: 1 }}>
          {heading}
        </Grid>
      </Grid>
    </AppBar>

    <Grid container style={{paddingTop: 1}}>
      {children.map(
        child => (child
          ? <Grid item sx={{ width: "100%", ml: 1, overflowX: "auto" }}>
            {child}
          </Grid>
          : null
        )
      )}
    </Grid>

  </Paper >
}

export default Card;