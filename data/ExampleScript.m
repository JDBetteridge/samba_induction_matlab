%this script will perform all the tasks in the exercise from lesson 3.

load ../data/duck_population %loads the data - make sure that this directory is correct!

% 1 - Corrections to the data
pop_corrected = duck_population; %as a starting point, let's take the original data.
pop_corrected(2,5) = 28; %correct species 5, female population
pop_corrected(1,6) = duck_population(1,6) - 17;
pop_corrected(3,6) = duck_population(3,6) + 17; %correct species 6's male-duckling miscount
pop_corrected(:,1) = [45; 43; 3]; %re-assign the whole of column 1, which is species 1's data
pop_corrected(:,2:3) = [duck_population(:,3) duck_population(:,2)]; % swap species 2 and 3's data
fprintf('The corrected data looks like: \n')
disp(pop_corrected)

% 2 - Save the corrected data
save "pop_corrected.mat" pop_corrected

% 3 - Means and standard deviations
avgs = mean(pop_corrected, 2); %row-wise 
stdevs = std(pop_corrected, 0, 2); %row-wise
fprintf('Males | mean = %.2f , stdev = %.2f \n', avgs(1), stdevs(1))
fprintf('Females | mean = %.2f , stdev = %.2f \n', avgs(2), stdevs(2))
fprintf('Ducklings | mean = %.2f , stdev = %.2f \n', avgs(3), stdevs(3))

% 4 - Max and min

%find the maximum along the rows of the array; returning the maximal values in the vector max_vals and
% the index of the maximal value in the vector max_species. 
% Note that the index numbering corresponds to the column index, IE the species number. 
[max_vals max_species] = max(pop_corrected, [], 2); 

%similarly, do this for the minimal values.
[min_vals min_species] = min(pop_corrected, [], 2);

%now let's print everything out...
fprintf('Males | Max population is %d for species %d \n', max_vals(1), max_species(1))
fprintf('Females | Max population is %d for species %d \n', max_vals(2), max_species(2))
fprintf('Ducklings | Max population is %d for species %d \n', max_vals(3), max_species(3))

fprintf('Males | Min population is %d for species %d \n', min_vals(1), min_species(1))
fprintf('Females | Min population is %d for species %d \n', min_vals(2), min_species(2))
fprintf('Ducklings | Min population is %d for species %d \n', min_vals(3), min_species(3))