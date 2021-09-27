# Police Management Interface: qb-pmi [WIP]
This PMI was built for the purpose of getting rid of all the other google sheets and discord channels we were using to keep track of police things. Not all features might make sense for your server.

[Support my Porjects](https://ko-fi.com/fjhstudios)

[Discord](https://discord.gg/CN8chwsK7E)
## WIP
Development of this resources is still ongoing. Theres a lot to do so its going to take some time. Here how ever are some screenshots of things that are being built at the moment.


![Duty Screen](https://i.imgur.com/IjLWkjj.png)
![Person Screen](https://i.imgur.com/sgkf7Ul.png)

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-police](https://github.com/qbcore-framework/qb-policejob)
- [ghmattimysql](https://github.com/GHMatti/ghmattimysql/releases) or [oxmysql](https://github.com/overextended/oxmysql/releases)

## Installation
Please read this carefully otherwise the PMI will not work.

### SQL
Run the `qb-pmi.sql` file in your database to ensure you have the tables needed for the PMI

### Config file changes

``enableOxmysql`` - Set to `true` if you are using oxmysql instead of ghmattimysql


### Required Functions
These functions need to be added to other resources in order for PMI functionality to work fully
#### qb-policejob/client/main.lua
```lua
RegisterNetEvent('police:client:setDuty')
AddEventHandler('police:client:setDuty', function(duty)
    if(PlayerJob.name == nil) then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
    onDuty = duty
end)
```

### Optional Functions
These functions or triggers improve the feel and experience of using the PMI. You do not need to do these but it is recommended.

#### Automatic updating of on duty vehicles
Where you take out the police vehicle add the following code to send the vehicle to the PMI (change the `vehicle` variable to the correct variable with the vehicle the player is in)
```lua
TriggerServerEvent("qb-pmi:server:vehicleTakeout", GetVehicleNumberPlateText(vehicle), GetEntityModel(vehicle))
```
Then for storing the vehicle add the following for while the player is still in the vehicle
```lua
TriggerServerEvent("qb-pmi:server:vehicleStore", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())))
```

#### Auto setting a units radio channel
You need to add a call to update the officers radio channel on the PMI 

**HINT:** If you are using pma-voice you need to go to `pma-voice/client/module/radio.lua` and add it in the `setRadioChannel(channel)` function.
```lua
TriggerServerEvent('qb-pmi:server:setOfficerRadio', channel)
```
The `channel` variable should be the numerical channel value.

## Development Setup [Not needed for normal usage]
The source files for the UI are included in `client/pmi-source`, these can be used to change the PMI or add new things.

**Disclaimer:** Just because you changed something or added a new feature to the PMI does not give you rights to release the whole PMI as your own work. If its an amazing feature that everyone and there dog needs then make a pull request on github and I can see if it can become a permanent part of the project.

### Setup
1. Open the `client/pmi-source` directory and run `npm install` to install node modules
2. To view the UI in your browser do `npm run serve`
3. Make any changes you want an then run `npm run build` to build the files.
4. The build files automatically go to the html directory, now just restart the resource on your server and you should see the changes.
