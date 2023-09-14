run('parameters.m');

delta_t = 0.001; % シミュレーションのステップ時間
simulation_time = 1; % シミュレーションの時間[s]

t = 0 : delta_t : simulation_time; % 時間
velocity = zeros(1, length(t));
v0 = 0;
velocity(1) = v0; % 初速 [m/s]

acc_time = (max_velocity - v0) / max_acceleration; % 加速&減速にかかる時間[s]
const_time = simulation_time - 2 * acc_time; %等速で動く時間[s]

time = 0;
for i = 2 : length(t)
    if 0 <= time && time <= acc_time
        velocity(i) = velocity(i-1) + max_acceleration * delta_t;
        if(velocity(i) >= max_velocity) 
            velocity(i) = max_velocity;
        end
    elseif acc_time < time && time <= (acc_time + const_time)
        velocity(i) = max_velocity;
    elseif (acc_time + const_time) < time && time <= simulation_time
        velocity(i) = velocity(i-1) - max_acceleration * delta_t;
    end
    
    time = time + delta_t;
end

velocity(end) = v0;
% acc_time = (max_velocity - v0) / max_acceleration; % 加速&減速にかかる時間[s]
% const_time = simulation_time - 2 * acc_time; %等速で動く時間[s]
% 
% t_acc = 0 : delta_t : acc_time;
% t_const = 0 : delta_t : const_time - delta_t;
% t_dec = 0 : delta_t : acc_time - delta_t;
% 
% velocity_acc = v0 + max_acceleration * t_acc; % 加速の速度変化
% velocity_const = velocity_acc(end) + 0 * t_const;
% velocity_dec = velocity_const(end) - max_acceleration * t_dec; % 減速の速度変化
% 
% velocity = [velocity_acc, velocity_const, velocity_dec];
% 
t = 0 : delta_t : simulation_time;
plot(t, velocity);
