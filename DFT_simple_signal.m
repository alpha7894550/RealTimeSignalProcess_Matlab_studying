% Parameters
N = 128; % Number of samples (higher N for better frequency resolution)
x = linspace(0, 1, N); % Normalized time vector (0 to 1)
fs = 1 / (x(2) - x(1)); % Sampling frequency (cycles per second)

% Signal definition
g = sin(10*pi*x) + cos(6*pi*x); % g(x) = sin(10pi*x) + cos(6pi*x)

% Compute DFT using FFT
G = fft(g); % Fast Fourier Transform
f = (0:N-1) * (fs / N); % Frequency vector

% Extract positive frequency components for display
G_magnitude = abs(G(1:N/2)); % Magnitude of FFT (positive frequencies only)
frequencies = f(1:N/2); % Positive frequency vector

% Plot the signal in time domain
figure;
subplot(2,1,1);
plot(x, g, 'b', 'LineWidth', 1.5);
title('Time-Domain Signal: g(x) = sin(10\pi x) + cos(6\pi x)');
xlabel('Time (x)');
ylabel('Amplitude');
grid on;

% Plot the DFT result (magnitude spectrum)
subplot(2,1,2);
stem(frequencies, G_magnitude, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
title('Frequency-Domain Spectrum of g(x)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
