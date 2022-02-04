tic;
        fileTest=strcat('E:\Bachlor_Project\Analysis\Data\Testing\left (2).wav');  %% loading Test Signal
        [dataTest,FsTest]= audioread(fileTest);
        downsampleTest=downsample(dataTest,5);
        indexOfTest = downsampleTest > 0.005 | downsampleTest < -0.005;  % Removing Silence From Signal
        TestWithoutSilence = downsampleTest(indexOfTest);
        TestWithoutSilence_ZNormalized= (TestWithoutSilence- mean(TestWithoutSilence))/ std(TestWithoutSilence); % Z-Normalizing the signal


        fileSample=strcat('E:\Bachlor_Project\Analysis\Data\Testing\right\right (20).wav');  %% loading Sample Signal
        [dataSample,FsSample]= audioread(fileSample);
        downsampleSample=downsample(dataSample,5);
        indexOfSample = downsampleSample > 0.005 | downsampleSample < -0.005; % Removing Silence From Signal
        sampleWithoutSilence = downsampleSample(indexOfSample);
        sampleWithoutSilence_ZNormalized= (sampleWithoutSilence- mean(sampleWithoutSilence))/ std(sampleWithoutSilence); % Z-Normalizing the signal           
        
        
        test = TestWithoutSilence_ZNormalized;
        sample = sampleWithoutSilence_ZNormalized;
        row=length(sample);
        column=length(test);
        Table= zeros(row+1 , column+1);   % DTW Matrix
        for i= 1 : row+1
            for j= 1 : column+1
                Table(i,j) = inf;
            end
        end
        Table(1,1)=0;
        for i= 2: row+1
            for j = 2: column+1
                Table(i,j) = abs(sample(i-1) - test(j-1)) +  min([Table(i-1,j-1) Table(i,j-1) Table(i-1,j)]); % Euclidean_Distance
                %  Table(i,j) = abs(sample(i-1) - test(j-1)).^2 +  min([Table(i-1,j-1) Table(i,j-1) Table(i-1,j)]); % Squared Euclidean_Distance
            end
        end    
         Euclidean_Distance=Table(row+1 , column+1);  
        %Squared_Euclidean_Distance=Table(row+1 , column+1);

toc;

% %%%%%%%%%%%%%%%%

