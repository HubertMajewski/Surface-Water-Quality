import { useEffect } from 'react';
import Divider from '@mui/material/Divider';
import Drawer from '@mui/material/Drawer';
import List from '@mui/material/List';
import Box from '@mui/material/Box';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import HomeIcon from '@mui/icons-material/Home';
import LibraryBooksIcon from '@mui/icons-material/LibraryBooks';
import MenuBookIcon from '@mui/icons-material/MenuBook';
import PermMediaOutlinedIcon from '@mui/icons-material/PermMediaOutlined'
import { usePageContext } from '../PageContext';

const categories = [
  {
    id: 'Introduction',
    children: [
      { id: 'Surface Water Quality', icon: <PermMediaOutlinedIcon /> },
      // { id: 'Engineering', icon: <DnsRoundedIcon /> },
    ],
  },
  {
    id: 'Results',
    children: [
      { id: 'Surface Water Notebook', icon: <MenuBookIcon /> },
      { id: 'Interpolation Notebook', icon: <MenuBookIcon /> },
      { id: 'Preimpute Profile Report', icon: <LibraryBooksIcon /> },
      { id: 'Interpolate Profile Report', icon: <LibraryBooksIcon /> },
      { id: 'Interpolate Logs Profile Report', icon: <LibraryBooksIcon /> }
    ],
  },
];

const item = {
  py: '2px',
  px: 3,
  color: 'rgba(255, 255, 255, 0.7)',
  '&:hover, &:focus': {
    bgcolor: 'rgba(255, 255, 255, 0.08)',
  },
};

const itemCategory = {
  boxShadow: '0 -1px 0 rgb(255,255,255,0.1) inset',
  py: 1.5,
  px: 3,
};

export default function Navigator(props) {
  const [state, dispatch] = usePageContext();
  const { ...other } = props;

  const onChildClick = (id, childId) => {
    dispatch({ type: "subheading", value: id + " - " + childId })
    dispatch({ type: "selectedNavigation", value: id });
    dispatch({ type: "selectedSubnavigation", value: childId });
  }

  useEffect(() => {
    dispatch({ type: "subheading", value: categories[0].id + " - " + categories[0].children[0].id })
    dispatch({ type: "selectedNavigation", value: categories[0].id });
    dispatch({ type: "selectedSubnavigation", value: categories[0].children[0].id });
  }, [])

  return (
    <Drawer variant="permanent" {...other}>
      <List>

        <ListItem sx={{ ...item, ...itemCategory }}>
          <ListItemIcon>
            <HomeIcon />
          </ListItemIcon>
          <ListItemText>Project Overview</ListItemText>
        </ListItem>

        {categories.map(({ id, children }) => (

          <Box key={id} sx={{ bgcolor: '#101F33' }}>

            <ListItem sx={{ py: 2, px: 3 }}>
              <ListItemText sx={{ color: '#fff' }}>{id}</ListItemText>
            </ListItem>

            {children.map(({ id: childId, icon }) => (

              <ListItem disablePadding key={childId}>
                <ListItemButton onClick={() => onChildClick(id, childId)} sx={item}>
                  <ListItemIcon>{icon}</ListItemIcon>
                  <ListItemText>{childId}</ListItemText>
                </ListItemButton>
              </ListItem>

            ))}

            <Divider sx={{ mt: 2 }} />
          </Box>
        ))}
      </List>
    </Drawer>
  );
}
