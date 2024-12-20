import { useState, useEffect } from "react";
import TaskRow from "./TaskRow";
import TaskForm from "./TaskForm";

const initialState=[
    {id:1, name:"Ver tutoriales de React", prioridad:3, completado:true},
    {id:2, name:"Escribir código React.js", prioridad:1, completado:false},
    {id:3, name:"Hacer front-end", prioridad:1, completado:false},
    {id:4, name:"Hacer conexion a MySQL", prioridad:1, completado:false},
    {id:5, name:"Hacer back-end", prioridad:1, completado:false},
    {id:6, name:"Agregar Seguridad", prioridad:1, completado:false},
];

const TaskTable = () => {

    const headers = ["No.", "Task", "Prioridad", "Completado"];
    
    const [tasks,setTasks] = useState([]);

    useEffect( ()=> {
        //console.log("Iniciando...");
        setTasks(initialState);
    },[]);
    
    const toggleTask = ( id )=>{
        //console.log( id );
        //console.log( "*** Click! ");
        setTasks( tasks.map( (task) => (task.id===id ? {...task,completado:!task.completado} : task)));
    }    
    
    const addNewTask = (newTaskName) =>{
        setTasks([...tasks,{id:tasks.length+1,name:newTaskName,prioridad:1, completado:false}]); 
    }

    const headerStyle = {textAlign:"center", fontWeight:"bold"};
    return(
        <div>
            <h1>Table Task</h1>
            <hr></hr>
            <TaskForm addNewTask={addNewTask}></TaskForm>
            <div className="row">
                <div className="col-md-4"></div>
                <div className="col-md-8"></div>
                <div className="table-responsive">
                    <table className="table">
                        <thead>
                            <tr>                                                  
                                {/* <th>#</th>
                                <th>Task</th>
                                <th>Prioridad</th>
                                <th>Completado</th> */}
                                {/* <th>Index</th> */}
                                {headers.map((header, index)=>(
                                    <th style={headerStyle} key={index}>{header}</th>
                                ))}
                            </tr>
                        </thead>
                        <tbody>
                            {tasks.map((task, index)=>(
                                <TaskRow key={task.id} index={index} task={task} toggleTask={toggleTask}></TaskRow>
                                // <tr key={index}>
                                //     <td>{task.id}</td>
                                //     <td>{task.name}</td>
                                //     <td>{task.priordad}</td>
                                //     <td>{task.completado}</td>
                                // </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}

//*******************************************************************/
//
// Componente funcional (componente basado en funciones)
//
//*******************************************************************/

export default TaskTable;
