import React from 'react';
import FormControl from '@material-ui/core/FormControl';
import { Select, Box, MenuItem } from '@material-ui/core';

export default function WineSelect() {
    const [state, setState] = React.useState({
        wine: 'None',
    });

    const handleChange = (event) => {
        setState({
            wine: event.target.value,
        });
    };

    return (
        <Box textAlign="center" bgcolor="primary.main">
            <FormControl>
                <Select
                    value={state.wine}
                    onChange={handleChange}
                    inputProps={{ 'aria-label': 'Select Wine' }}
                >
                    <MenuItem value="None">
                        None
                    </MenuItem>
                    <MenuItem value="value">value</MenuItem>
                </Select>
            </FormControl>
        </Box>
    );
}
