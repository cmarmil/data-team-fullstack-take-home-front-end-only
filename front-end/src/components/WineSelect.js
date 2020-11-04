import React, { useEffect } from 'react';
import FormControl from '@material-ui/core/FormControl';
import { Select, Box, MenuItem } from '@material-ui/core';

export default function WineSelect() {
    const [state, setState] = React.useState({
        selectedWine: 'None',
        wines: [],
    });

    const handleChange = (event) => {
        setState({
            ...state,
            selectedWine: event.target.value,
        });
    };

    const fetchWines = () => {
        fetch('http://localhost:3000/wines/')
            .then((response) => response.json())
            .then((data) => setState({
                ...state,
                wines: data,
            }));
    };

    useEffect(() => {
        fetchWines();
    }, []);

    return (
        <Box textAlign="center" bgcolor="primary.main">
            <FormControl>
                <Select
                    value={state.selectedWine}
                    onChange={handleChange}
                    inputProps={{ 'aria-label': 'Select Wine' }}
                >
                    <MenuItem value="None">
                        None
                    </MenuItem>
                    {state.wines.map((wine) => (
                        <MenuItem key={wine.id} value={wine.name}>{wine.name}</MenuItem>
                    ))}
                </Select>
            </FormControl>
        </Box>
    );
}
