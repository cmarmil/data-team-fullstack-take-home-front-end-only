import React, { useEffect } from 'react';
import PropTypes from 'prop-types';
import { makeStyles } from '@material-ui/core/styles';
import {
    Card, CardContent, Box,
} from '@material-ui/core';
import Typography from '@material-ui/core/Typography';
import productImage from '../assets/wines/folk-and-fable.png';

const useStyles = makeStyles((theme) => ({
    root: {
        width: '33%',
        margin: '.5em',
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
        paddingTop: '1em',
    },
    image: {
        position: 'absolute',
        height: '100%',
        textAlign: 'center',
    },
    cardSubText: {
        fontSize: '1.2rem',
    },
}));


export default function WineDetailsCard({ wineId }) {
    WineDetailsCard.propTypes = {
        wineId: PropTypes.string.isRequired,
    };

    const [wineInfo, setWineInfo] = React.useState({});

    const [tasteTags, setTags] = React.useState([]);

    const fetchWineDetails = () => {
        if (wineId) {
            fetch(`http://localhost:3000/wines/${wineId}/`)
                .then((response) => response.json())
                .then((data) => setWineInfo(data));
        }
    };

    const fetchWineTags = () => {
        if (wineId) {
            fetch(`http://localhost:3000/wines/${wineId}/taste_tags/`)
                .then((response) => response.json())
                .then((data) => data.taste_tags.map((tagObj) => (tagObj.name)))
                .then((data) => setTags(data));
        }
    };

    useEffect(() => {
        fetchWineDetails();
        fetchWineTags();
    }, [wineId]);

    const classes = useStyles();

    return (
        <Card className={classes.root}>
            <Box className={classes.box}>
                <img className={classes.image} src={productImage} alt="Wine Bottle" />
            </Box>
            <CardContent>
                <Typography gutterBottom component="h2" className={classes.cardSubText}>
                    {wineInfo.name}
                </Typography>
                <Box display="flex" alignItems="center">
                    <Typography component="h3">
                        {wineInfo.brand_name}
                    </Typography>
                    <Box m="0 .3rem">&#8226;</Box>
                    <Typography component="h3">
                        {wineInfo.varietal_name}
                    </Typography>
                </Box>
                <Typography variant="body2" color="textSecondary" component="p">
                    {wineInfo.description}
                </Typography>
                <Typography variant="body2" color="textSecondary" component="p">
                    Tags:
                    {' '}
                    {tasteTags.join(', ')}
                </Typography>
            </CardContent>
        </Card>
    );
}
