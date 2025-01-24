% Run MVMD for different alpha values and save the results
alpha = 1000;    
tau = 0;         
K = 7;           
DC = 0;          
init = 0.5;      
tol = 1e-7;      

alphas = [500, 750, 1000, 1250, 1500]; 
numSubjects = 10; 

for alpha = alphas
    folderName = ['New_Results_Alpha_', num2str(alpha)];
    if ~exist(folderName, 'dir')
        mkdir(folderName);
    end

    for i = 1:numSubjects
        m = squeeze(allData(i, :, :));
        
        [u, u_hat, omega] = MVMD(m, alpha, tau, K, DC, init, tol);
        
        save(fullfile(folderName, ['u_subject_', num2str(i), '.mat']), 'u');
        save(fullfile(folderName, ['u_hat_subject_', num2str(i), '.mat']), 'u_hat');
        save(fullfile(folderName, ['omega_subject_', num2str(i), '.mat']), 'omega');
    end
end
