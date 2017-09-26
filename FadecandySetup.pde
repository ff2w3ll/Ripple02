/*

REF:
https://learn.adafruit.com/1500-neopixel-led-curtain-with-raspberry-pi-fadecandy/fadecandy-server-setup
https://github.com/scanlime/fadecandy/blob/master/doc/fc_server_config.md

>> TOP : JBRBGUACSYXLRPUP
>> BOTTOM : FBTDVNKCRFIJELAL

=== JSON START ===
{
    "listen": [null, 7890],
    "verbose": true,

    "color": {
        "gamma": 2.5,
        "whitepoint": [0.8, 0.8, 0.8]
    },

    "devices": [
      {
          "type": "fadecandy",
          "serial": "JBRBGUACSYXLRPUP",
          "map": [
              [ 0, 0, 0, 50 ],
              [ 0, 50, 64, 50 ],
              [ 0, 100, 128, 50 ],
              [ 0, 150, 192, 50 ],
              [ 0, 200, 256, 50 ],
              [ 0, 250, 320, 50 ],
              [ 0, 300, 384, 50 ],
              [ 0, 350, 448, 50 ]
            ]
        },
        {
            "type": "fadecandy",
            "serial": "FBTDVNKCRFIJELAL",
            "map": [
              [ 0, 400, 0, 50 ],
              [ 0, 450, 64, 50 ],
              [ 0, 500, 128, 50 ],
              [ 0, 550, 192, 50 ],
              [ 0, 600, 256, 50 ],
              [ 0, 650, 320, 50 ],
              [ 0, 700, 384, 50 ],
              [ 0, 750, 448, 50 ]
            ]
        }
    ]
}
=== JSON END ===

*/