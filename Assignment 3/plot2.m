alphas = [500, 750, 1000, 1250, 1500]; % Range of alpha values
numSubjects = 10;                      % Number of subjects/files
K = 10;                                % Fixed number of modes

allModes = zeros(length(alphas), K, numSubjects); % Preallocate for modes

for alphaIdx = 1:length(alphas)
    alpha = alphas(alphaIdx);
    folderName = ['Results_Alpha_', num2str(alpha)];
    
    for i = 1:numSubjects
        % Load omega for the current subject and alpha
        omegaFile = fullfile(folderName, ['omega_subject_', num2str(i), '.mat']);
        data = load(omegaFile);
        omega = data.omega;
        
        % Store frequencies for the modes
        allModes(alphaIdx, :, i) = omega(end, :); % Store mode frequencies
    end
end

% Compute the average and standard deviation across subjects for each alpha and mode
meanModes = mean(allModes, 3); % Mean across subjects
stdModes = std(allModes, 0, 3); % Standard deviation across subjects

% Plot the results
figure;
hold on;
colors = lines(length(alphas)); % Get distinct colors for each alpha

for alphaIdx = 1:length(alphas)
    x = 1:K; % Mode indices
    y = meanModes(alphaIdx, :);
    errorbar(x, y, stdModes(alphaIdx, :), 'o-', 'Color', colors(alphaIdx, :), ...
             'LineWidth', 1.5, 'DisplayName', ['\alpha = ', num2str(alphas(alphaIdx))]);
end

xlabel('Modes');
ylabel('Frequency (mHz)');
title(['Frequency of Each Mode for K = ', num2str(K)]);
legend('Location', 'best');
grid on;
hold off;
