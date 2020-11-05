import React, { useEffect } from 'react';
import PropTypes from 'prop-types';
import { makeStyles } from '@material-ui/core/styles';
import {
    Card, CardContent, Box,
} from '@material-ui/core';
import Typography from '@material-ui/core/Typography';


const useStyles = makeStyles((theme) => ({
    root: {
        width: '33%',
        margin: '.5em',
        height: 'fit-content',
        [theme.breakpoints.down('sm')]: {
            width: '100%',
        },
    },
}));


export default function RatingCards({ wineId }) {
    RatingCards.propTypes = {
        wineId: PropTypes.string.isRequired,
    };

    const [state, setState] = React.useState({
        ratingInfo: [],
    });

    const fetchWineRatings = () => {
        if (wineId) {
            fetch(`http://localhost:3000/wines/${wineId}/ratings/`)
                .then((response) => response.json())
                .then((data) => setState({ ratingInfo: data.ratings }));
        }
    };

    const calcAverageRating = () => {
        let averageRating;
        const ratingNums = state.ratingInfo.map((rating) => rating.rating);
        if (ratingNums.length) {
            const average = ratingNums.reduce((a, b) => a + b) / ratingNums.length;
            averageRating = average.toFixed(2);
        }
        return averageRating;
    };

    useEffect(() => {
        fetchWineRatings();
    }, [wineId]);

    const classes = useStyles();

    return (
        <Card className={classes.root}>
            <CardContent>
                <Typography gutterBottom component="h2" variant="h5">
                    Reviews
                </Typography>
                <Typography gutterBottom component="h2">
                    Average Rating:
                    {' '}
                    {calcAverageRating()}
                </Typography>
                <Box padding="1.5em">
                    {state.ratingInfo.map((rating) => (
                        <Box key={rating.id} padding="1em 0" borderBottom="2px solid #bdbdbd">
                            <Typography gutterBottom component="h2">
                                Rating:
                                {' '}
                                {rating.rating}
                            </Typography>
                            <Typography variant="body2" color="textSecondary" component="p">
                                {rating.review}
                            </Typography>
                        </Box>
                    ))}
                </Box>
            </CardContent>
        </Card>
    );
}
