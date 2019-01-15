% singleRun.m
% this file is to run a single instance of the provided code

clc; clear all; close all; % house keeping


% data = readData('test1.txt') % gets data from '' file
exit = 0;
time = 0;
tasks = [];
robots = [];
numRobots = 0;

prompt = 'How many robots?';
numRobots = input(prompt);

robotFree = 1;

while exit ~= -1
    
    prompt = 'Time of new quest? (if no new quest place 0) (to exit place -1)';
    tempNewTask = input(prompt);
    exit = tempNewTask;
    if tempNewTask ~= 0
        tasks(end+1) = tempNewTask;
    end
    
    pTasks = ['tasks: ', num2str(tasks)];
    pRobots = ['robots: ', num2str(robots)];
    pTime = ['time: ', num2str(time)];
    TasksRobotsTime = printAll(tasks, robots, time)
    disp(pTasks)
    disp(pRobots)
    disp(pTime)
    disp('Assign robots and increase time by 1 second.');
    
    time = time + 1; % increment time
    if robotFree == 1
        robots(end+1) = 1;
        robotFree = 0;
    end
    
    for i = 1:length(tasks)
        if i<=length(robots)
            tasks(i) = tasks(i)-1;
        end
    end
    
    if length(tasks) <= 1
        disp('No more tasks');
    else
        if tasks(length(robots)) == 0
            robotFree = 1;
        end
    end
    
    deleteIndexs = find(tasks<0);
    tasks(deleteIndexs) = [];
    robots(deleteIndexs) = [];
    
    
    
end