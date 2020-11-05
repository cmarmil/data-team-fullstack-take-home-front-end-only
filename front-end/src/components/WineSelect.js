import React, { useEffect } from 'react';
import PropTypes from 'prop-types';
import FormControl from '@material-ui/core/FormControl';
import { Select, Box, MenuItem } from '@material-ui/core';

export default function WineSelect({ selectWine, currentWine }) {
    WineSelect.propTypes = {
        selectWine: PropTypes.func.isRequired,
        currentWine: PropTypes.string.isRequired,
    };

    const [wines, setWines] = React.useState([]);

    const fetchWines = () => {
        fetch('http://localhost:3000/wines/')
            .then((response) => response.json())
            .then((data) => setWines(data));
    };

    useEffect(() => {
        fetchWines();
    }, []);

    return (
        <Box textAlign="center" bgcolor="primary.main" padding=".5rem">
            <FormControl>
                <Select
                    value={currentWine}
                    onChange={selectWine}
                    inputProps={{ 'aria-label': 'Select Wine' }}
                >
                    <MenuItem value="None">
                        None
                    </MenuItem>
                    {wines.map((wine) => (
                        <MenuItem key={wine.id} data-id={wine.id} value={wine.name}>{wine.name}</MenuItem>
                    ))}
                </Select>
            </FormControl>
        </Box>
    );
}
