import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';


const useStyles = makeStyles({
    root: {
        alignSelf: 'center',
        margin: '0 auto',
    },
});

export default function PleaseSelectMessage() {
    const classes = useStyles();
    return <Typography className={classes.root} component="p" variant="h2">Please Select A Wine</Typography>;
}
