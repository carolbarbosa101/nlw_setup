import './styles/global.css';

import { Habit } from "./components/Habit"

function App() {
  return (
    <div> 
    <Habit completed={3}/>
    <Habit completed={34}/>
    <Habit completed={65}/>
    <Habit completed={5}/>
    </div>
  )
}
  
export default App
