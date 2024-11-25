% Custom DFT Implementation
function X = my_dft(x)
    N = length(x); % Number of samples
    X = zeros(1, N); % Initialize the DFT output
    for k = 0:N-1
        for n = 0:N-1
            X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
        end
    end
end

% Step 1: Load Data
data = readtable('Data for testing/IS1n_p54_shading66.csv'); % Replace with your CSV file
voltage = data{:, 1}; % Voltage values from the first column

% Step 2: Compute DFT
dft_result = my_dft(voltage); % Call the custom DFT function
frequencies = (0:N-1) * (fs / N); % Frequency vector
magnitude = abs(dft_result) / N; % Normalize magnitude

% Step 3: Plot Frequency Spectrum
figure;
plot(frequencies(1:N/2), magnitude(1:N/2)); % Plot positive frequencies
title('Frequency Spectrum (Using DFT)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
