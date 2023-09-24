clear

% 効率
eta = 0.7; % 走行抵抗やギアの損失をもろもろ考慮した効率

% 機構的なパラメータ
m = 120e-3; % 重量[kg]
T = 100e-3; % トレッド[m]
r = 11e-3; % タイヤの半径[m]

% モータのパラメータ
V_input = 12.6; % 印加電圧[V]
V_nominal = 4.5; %モータの公称電圧[V]
voltage_constant_times = V_input / V_nominal;

n_max = 12000 * voltage_constant_times; % 無負荷回転数[rpm]
omega_max = n_max * 2 * pi / 60; % 無負荷角速度[rad/s]
T_max = 5.45e-3 * voltage_constant_times; % 停動トルク[Nm]

% n_const = 2710 * voltage_constant_times; % 回転数定数[rpm/V]
% omega_const = n_const * 2 * pi / 60; % 角速度定数[rad/V]
% T_const = 3.52e-3 * voltage_constant_times; %トルク定数[Nm/A]


% 要求パラメータ
max_velocity = 5; % 最高速度[m/s]
max_acceleration = 25; % 最高加速度[m/s^2]