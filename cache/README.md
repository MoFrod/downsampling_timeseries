Here I have stored any data sets that (a) are generated during a preprocessing 
step and (b) don't need to be regenerated every single time the data is analysed. 

You can use the `cache()` function to store data to this directory automatically. 
Any data set found in both the `cache` and `data` directories will be drawn from 
`cache` instead of `data` based on ProjectTemplate's priority rules.
