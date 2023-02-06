## National-treasure Map Drawing​
​
You are part of a treasure hunters that travels around the world in order to solve puzzles, in your latest discovery you found the first clue of the Lost Snake Treasure.
​
The Clue says that you have to find the location where the snakes sleeps, this is a know phrase that refers to a river on Amazonia.
​
Your job is to generate a travel calculation from the headquarter of the crew and the Amazonia River based on how you gonna travel and the quantity of people on this journey.
​
You know that the distance between the 2 places for this example is 1000km, we have 4 different type of transports: by plane, by car, by motorcycle and by boat.
​
By plane every 2 minutes you travel 1km, by car you waste five time more to travel the same distance, by motorcycle you waste half the time the car took to travel the same distance and by boat you travel two time faster than the motorcycle 
​
Considering for this task there is 8 people on your crew, you had to pick the best choice.
​
If you are by motorcycle, you can only carry two people on it, if there is multiply motorcycles you have to multiple 10% on the total time per extra motorcycle on the road, the boat can only take 6 people at time, for every extra boat you multiply 5%, by car you can only drive 5 people at a time for every extra car you have to multiply by 15%.


```
Input 
Start point, Finish point, crew quantity. 
```


```
Output
Hours waste (time waste by transports)
```

<img width="1440" alt="Screen Shot 2023-02-06 at 12 07 34" src="https://user-images.githubusercontent.com/32275521/217007934-61849c05-ae02-4c1e-a624-21d63c438791.png">



### Usage

* Run project

```shell
elm reactor
```

* Run unit tests
```
elm-test
```
