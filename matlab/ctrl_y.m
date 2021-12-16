function k=ctrl_y(a)
robot = java.awt.Robot;
k=a;
switch a
    case 2
        robot.keyRelease  (java.awt.event.KeyEvent.VK_UP);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
        robot.keyPress    (java.awt.event.KeyEvent.VK_DOWN);
        label='DOWN'
    case 4
        robot.keyRelease  (java.awt.event.KeyEvent.VK_UP);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_DOWN);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
        robot.keyPress    (java.awt.event.KeyEvent.VK_LEFT);
        label='LEFT'
    case 5
        robot.keyRelease  (java.awt.event.KeyEvent.VK_UP);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_DOWN);
        label='STOP'
    case 6
        robot.keyRelease  (java.awt.event.KeyEvent.VK_UP);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_DOWN);
        robot.keyPress    (java.awt.event.KeyEvent.VK_RIGHT);
        label='RIGHT'
    case 8
        robot.keyRelease  (java.awt.event.KeyEvent.VK_DOWN);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
        robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
        robot.keyPress    (java.awt.event.KeyEvent.VK_UP);
        label='UP'
end