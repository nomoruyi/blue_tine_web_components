

const routineData = {
    name: '',
    status: '',
}

function finishRoutine() {
    this.routineData.finish();

    finishRoutineChannel.postMessage(JSON.stringify(this.routineData))
}

