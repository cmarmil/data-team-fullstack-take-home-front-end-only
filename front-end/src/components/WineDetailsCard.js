import React, { useEffect } from 'react';
import PropTypes from 'prop-types';
import { makeStyles } from '@material-ui/core/styles';
import {
    Card, CardContent, Box,
} from '@material-ui/core';
import Typography from '@material-ui/core/Typography';
import productImage from '../assets/wines/folk-and-fable.png';

const useStyles = makeStyles(theme => ({
    root: {
        width: '33%',
        margin: ".5em",
        height: 'fit-content',
        [theme.breakpoints.down('sm')]: {
            width: '100%',
          },
    },
    box: {
        position: 'relative',
        paddingBottom: '56.2%',
        justifyContent: 'center',
        display: 'flex',
        paddingTop: '1em'
    },
    image: {
        position: 'absolute',
        height: '100%',
        textAlign: 'center',
    },
    cardSubText: {
      fontSize: '1.2rem'  
    },
}));


export default function WineDetailsCard({ wineId }) {
    WineDetailsCard.propTypes = {
        wineId: PropTypes.string.isRequired,
    };

    const [state, setState] = React.useState({
        wineInfo: {},
    });

    const fetchWineDetails = () => {
        if (wineId) {
            fetch(`http://localhost:3000/wines/${wineId}/`)
                .then((response) => response.json())
                .then((data) => setState({ wineInfo: data }));
        }
    };

    useEffect(() => {
        fetchWineDetails();
    }, [wineId]);

    const classes = useStyles();

    return (
        <Card className={classes.root}>
                <Box className={classes.box}>
                    <img className={classes.image} src={productImage} alt="Wine Bottle" />
                </Box>
                <CardContent>
                    <Typography gutterBottom component="h2" className={classes.cardSubText}>
                        {state.wineInfo.name}
                    </Typography>
                    <Box display="flex" alignItems="center">
                        <Typography component="h3">
                            {state.wineInfo.brand_name}
                        </Typography>
                        <Box m="0 .3rem">&#8226;</Box>
                        <Typography component="h3">
                            {state.wineInfo.varietal_name}
                        </Typography>
                    </Box>
                    <Typography variant="body2" color="textSecondary" component="p">
                        {state.wineInfo.description}
                    </Typography>
                </CardContent>
        </Card>
    );
}
