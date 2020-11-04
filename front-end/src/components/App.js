import React from 'react';
import WineSelect from './WineSelect';
import WineDetailsCard from './WineDetailsCard';
import Ratings from './Ratings';
import PleaseSelectMessage from './PleaseSelectMessage';
import styles from './App.scss';

const App = () => {
    const [state, setState] = React.useState({
        currentWine: 'None',
        currentWineId: null,
    });

    function setCurrentWine(event) {
        setState({
            currentWine: event.target.value,
            currentWineId: event.nativeEvent.target.getAttribute('data-id'),
        });
    }

    return (
        <div className={styles.container}>
            <WineSelect
                selectWine={(event) => setCurrentWine(event)}
                currentWine={state.currentWine}
            />
            <div className={styles.resultsContainer}>
                {state.currentWine !== 'None'
                    ? (
                        <>
                            <WineDetailsCard wineId={state.currentWineId} />
                            <Ratings wineId={state.currentWineId} />
                        </>
                    )
                    : <PleaseSelectMessage/>}
            </div>
        </div>
    );
};

export default App;
