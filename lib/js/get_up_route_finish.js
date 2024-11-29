

interface IRoutineStepData {
    name: string;
    status: string;
    startTime: string;
    endTime: string;
    duration: string;
    skipped: boolean;
}

interface IRoutineData {
    name: string;
    status: string;
    startTime: string;
    endTime: string;
    rating: string;
    comment: string;
    stepsData: IRoutineStepData[];
}

function finishRoutine(routineData: IRoutineData) {
    finishRoutineChannel.postMessage(JSON.stringify(routineData));
}

