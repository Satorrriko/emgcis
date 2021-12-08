function k=ctrl(a)
robot = java.awt.Robot;

switch a
    case 1
        robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
        robot.keyPress    (java.awt.event.KeyEvent.VK_LEFT);
        label='left'
    case 3
        robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);   
        robot.keyPress    (java.awt.event.KeyEvent.VK_RIGHT);        
        label='right'
    case 2
        robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
        label='stop'
end