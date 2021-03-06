import React from 'react';
import PropTypes from 'prop-types';
import { makeStyles } from '@material-ui/core/styles';
import {
    Card, CardContent, Button, Slider, TextField,
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
    button: {
        marginTop: '1em',
    },
}));


export default function NewReview({ wineId, handleNewRating }) {
    NewReview.propTypes = {
        wineId: PropTypes.string.isRequired,
        handleNewRating: PropTypes.func.isRequired,
    };

    const classes = useStyles();

    const [textValue, setValue] = React.useState('Review');

    const [sliderValue, setSliderValue] = React.useState(3);

    const handleChange = (event) => {
        setValue(event.target.value);
    };

    const handleSubmit = () => {
        const newReview = {
            rating: sliderValue,
            review: textValue,
        };
        async function postData(url = '', data = newReview) {
            const response = await fetch(url, {
                method: 'POST',
                mode: 'cors',
                cache: 'no-cache',
                credentials: 'same-origin',
                headers: {
                    'Content-Type': 'application/json',
                },
                redirect: 'follow',
                referrerPolicy: 'no-referrer',
                body: JSON.stringify(data),
            });
            return response.json();
        }
        postData(`http://localhost:3000/wines/${wineId}/ratings/`);
        handleNewRating(newReview);
    };

    return (
        <Card className={classes.root}>
            <CardContent>
                <Typography gutterBottom component="h2" variant="h5">
                    New Review
                </Typography>
                <Typography gutterBottom component="h2">
                    Rating
                </Typography>
                <Slider
                    defaultValue={3}
                    aria-labelledby="discrete-slider"
                    valueLabelDisplay="auto"
                    step={1}
                    min={1}
                    max={5}
                    onChangeCommitted={(e, val) => setSliderValue(Number(val))}
                />
                <form autoComplete="off">
                    <TextField
                        error={!textValue.trim()}
                        fullWidth
                        variant="outlined"
                        id="standard-multiline-flexible"
                        multiline
                        onChange={handleChange}
                        value={textValue}
                        helperText={textValue.trim() ? '' : 'Review cannot be empty'}
                    />
                    <Button
                        className={classes.button}
                        disabled={!textValue.trim()}
                        variant="contained"
                        color="primary"
                        onClick={handleSubmit}
                    >
                        Submit Review
                    </Button>
                </form>
            </CardContent>
        </Card>
    );
}
