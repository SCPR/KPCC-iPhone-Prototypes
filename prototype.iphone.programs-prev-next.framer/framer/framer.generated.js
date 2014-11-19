// This is autogenerated by Framer Studio


// Generated by CoffeeScript 1.8.0
(function() {
  var lookupLine, properties, _RESULT,
    __slice = [].slice;

  if (window.FramerStudio == null) {
    window.FramerStudio = {};
  }

  window.onerror = null;

  window.midiCommand = window.midiCommand || function() {};

  if (Framer.Device) {
    properties = ["deviceScale", "contentScale", "deviceType", "keyboard", "orientation", "fullScreen"];
    properties.map(function(propertyName) {
      return Framer.Device.on("change:" + propertyName, function() {
        return window._bridge("device:change");
      });
    });
  }

  _RESULT = null;

  lookupLine = function(lineNumber) {
    var char, charIndex, errorColNumber, errorLine, errorLineIndex, errorLineNumber, loc, sourceLines, _i, _len;
    sourceLines = _RESULT.js.split("\n");
    errorLineIndex = lineNumber - 1;
    errorLine = sourceLines[errorLineIndex];
    if (!errorLine) {
      return lineNumber;
    }
    errorLineNumber = 1;
    errorColNumber = 0;
    for (charIndex = _i = 0, _len = errorLine.length; _i < _len; charIndex = ++_i) {
      char = errorLine[charIndex];
      loc = _RESULT.sourceMap.sourceLocation([errorLineIndex, charIndex]);
      if (loc && loc[0] > errorLineNumber) {
        errorLineNumber = loc[0] + 1;
        errorColNumber = loc[1];
      }
    }
    console.log("lineNumber", lineNumber);
    console.log("errorLineNumber", errorLineNumber);
    return errorLineNumber;
  };

  FramerStudio.compile = function(code) {
    var e, err, errorMessage;
    console.log("FramerStudio.compile");
    window.onerror = null;
    window.onresize = null;
    try {
      _RESULT = CoffeeScript.compile(code, {
        sourceMap: true,
        filename: "generated.js"
      });
    } catch (_error) {
      e = _error;
      console.log("Compile error:", e);
      if (e instanceof SyntaxError) {
        errorMessage = e.stack;
        err = new SyntaxError(e.message);
        err.line = e.location.first_line;
        err.lineNumber = e.location.first_line;
        err.lookup = true;
        window._bridge("StudioError", {
          message: e.message,
          line: e.location.first_line,
          lineNumber: e.location.first_line,
          errorType: "compile"
        });
        throw err;
      } else {
        throw e;
      }
    }
    window.onerror = function(errorMsg, url, lineNumber) {
      var error;
      console.log.apply(console, ["Eval error:"].concat(__slice.call(arguments)));
      error = new Error(errorMsg);
      error.line = lookupLine(lineNumber);
      window._bridge("StudioError", {
        message: errorMsg,
        line: error.line,
        lineNumber: error.line,
        errorType: "eval"
      });
      throw error;
    };
    return _RESULT.js;
  };

  if (typeof window._bridge === "function") {
    window._bridge("StudioScriptLoaded");
  }

}).call(this);

window.__imported__ = window.__imported__ || {};
window.__imported__["prev-next/layers.json.js"] = [
  {
    "maskFrame" : null,
    "id" : "A7353614-C71A-4BF4-BDC3-42F5A2B40614",
    "visible" : true,
    "children" : [
      {
        "maskFrame" : null,
        "id" : "3A980765-1FF4-4F1B-8C9A-9419CE60EEF3",
        "visible" : true,
        "children" : [
          {
            "maskFrame" : null,
            "id" : "991ED392-518B-411E-91F8-20650A45A02B",
            "visible" : true,
            "children" : [

            ],
            "image" : {
              "path" : "images\/topmenu-991ED392-518B-411E-91F8-20650A45A02B.png",
              "frame" : {
                "y" : 63,
                "x" : 28,
                "width" : 49,
                "height" : 28
              }
            },
            "imageType" : "png",
            "layerFrame" : {
              "y" : 63,
              "x" : 28,
              "width" : 49,
              "height" : 28
            },
            "name" : "topmenu"
          },
          {
            "maskFrame" : null,
            "id" : "BF4B9DF3-E2C5-430B-B7EF-CAA8F0DD5BCA",
            "visible" : true,
            "children" : [

            ],
            "image" : {
              "path" : "images\/KPCC_Live__disclosure_indicator_3-BF4B9DF3-E2C5-430B-B7EF-CAA8F0DD5BCA.png",
              "frame" : {
                "y" : 61,
                "x" : 241,
                "width" : 157,
                "height" : 38
              }
            },
            "imageType" : "png",
            "layerFrame" : {
              "y" : 61,
              "x" : 241,
              "width" : 157,
              "height" : 38
            },
            "name" : "KPCC_Live__disclosure_indicator_3"
          },
          {
            "maskFrame" : null,
            "id" : "9CB4AD48-7422-48E7-BE88-06DCFE67CC21",
            "visible" : true,
            "children" : [
              {
                "maskFrame" : null,
                "id" : "5189D7B0-9812-44B3-A82B-383062126393",
                "visible" : true,
                "children" : [

                ],
                "image" : {
                  "path" : "images\/lightcontent_status_bar-5189D7B0-9812-44B3-A82B-383062126393.png",
                  "frame" : {
                    "y" : 6,
                    "x" : 11,
                    "width" : 616,
                    "height" : 29
                  }
                },
                "imageType" : "png",
                "layerFrame" : {
                  "y" : 6,
                  "x" : 11,
                  "width" : 616,
                  "height" : 29
                },
                "name" : "lightcontent_status_bar"
              }
            ],
            "image" : {
              "path" : "images\/Rectangle_61__lightcontent_status_bar-9CB4AD48-7422-48E7-BE88-06DCFE67CC21.png",
              "frame" : {
                "y" : 6,
                "x" : 11,
                "width" : 616,
                "height" : 29
              }
            },
            "imageType" : "png",
            "layerFrame" : {
              "y" : 6,
              "x" : 11,
              "width" : 616,
              "height" : 29
            },
            "name" : "Rectangle_61__lightcontent_status_bar"
          }
        ],
        "image" : {
          "path" : "images\/Navbar-3A980765-1FF4-4F1B-8C9A-9419CE60EEF3.png",
          "frame" : {
            "y" : 0,
            "x" : 0,
            "width" : 640,
            "height" : 119
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 0,
          "x" : 0,
          "width" : 640,
          "height" : 119
        },
        "name" : "Navbar"
      },
      {
        "maskFrame" : null,
        "id" : "FC94BC74-CC3B-49C3-892D-C79DF64E9F8B",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/Show_Title-FC94BC74-CC3B-49C3-892D-C79DF64E9F8B.png",
          "frame" : {
            "y" : 154,
            "x" : 29,
            "width" : 582,
            "height" : 39
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 154,
          "x" : 29,
          "width" : 582,
          "height" : 39
        },
        "name" : "Show_Title"
      },
      {
        "maskFrame" : null,
        "id" : "5CC26AB3-323F-4103-AE0E-205CFB3DDF9B",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/PrevEpisodeTitle-5CC26AB3-323F-4103-AE0E-205CFB3DDF9B.png",
          "frame" : {
            "y" : 479,
            "x" : 30,
            "width" : 446,
            "height" : 155
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 479,
          "x" : 30,
          "width" : 446,
          "height" : 155
        },
        "name" : "PrevEpisodeTitle"
      },
      {
        "maskFrame" : null,
        "id" : "3884082B-1240-4A67-87EF-83D58249CEE7",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/LoadingEpisode-3884082B-1240-4A67-87EF-83D58249CEE7.png",
          "frame" : {
            "y" : 702,
            "x" : 32,
            "width" : 122,
            "height" : 34
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 702,
          "x" : 32,
          "width" : 122,
          "height" : 34
        },
        "name" : "LoadingEpisode"
      },
      {
        "maskFrame" : null,
        "id" : "30E1805B-E6CE-42AD-B437-BA2E3EA59CC8",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/PrevTrackProgress-30E1805B-E6CE-42AD-B437-BA2E3EA59CC8.png",
          "frame" : {
            "y" : 701,
            "x" : 14,
            "width" : 172,
            "height" : 59
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 701,
          "x" : 14,
          "width" : 172,
          "height" : 59
        },
        "name" : "PrevTrackProgress"
      },
      {
        "maskFrame" : null,
        "id" : "225BA07F-380E-45A2-8474-0B33B02F2C5E",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/NextEpisodeTitle-225BA07F-380E-45A2-8474-0B33B02F2C5E.png",
          "frame" : {
            "y" : 479,
            "x" : 28,
            "width" : 548,
            "height" : 155
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 479,
          "x" : 28,
          "width" : 548,
          "height" : 155
        },
        "name" : "NextEpisodeTitle"
      },
      {
        "maskFrame" : null,
        "id" : "749EDEC1-7919-4F08-A175-198ED68851B2",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/NextTrackProgress-749EDEC1-7919-4F08-A175-198ED68851B2.png",
          "frame" : {
            "y" : 701,
            "x" : 14,
            "width" : 172,
            "height" : 59
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 701,
          "x" : 14,
          "width" : 172,
          "height" : 59
        },
        "name" : "NextTrackProgress"
      },
      {
        "maskFrame" : null,
        "id" : "DE3E68C3-4483-42BA-982D-ED3494CD8A2A",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/CurrentEpisodeTitle-DE3E68C3-4483-42BA-982D-ED3494CD8A2A.png",
          "frame" : {
            "y" : 216,
            "x" : 30,
            "width" : 469,
            "height" : 154
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 216,
          "x" : 30,
          "width" : 469,
          "height" : 154
        },
        "name" : "CurrentEpisodeTitle"
      },
      {
        "maskFrame" : null,
        "id" : "656723F4-98F5-412E-A3D2-9E635EBF77D0",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/CurrentTrackProgress-656723F4-98F5-412E-A3D2-9E635EBF77D0.png",
          "frame" : {
            "y" : 701,
            "x" : 14,
            "width" : 208,
            "height" : 59
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 701,
          "x" : 14,
          "width" : 208,
          "height" : 59
        },
        "name" : "CurrentTrackProgress"
      },
      {
        "maskFrame" : null,
        "id" : "8182EFF0-0BB6-4BDD-82ED-2AB495687A19",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/Divider-8182EFF0-0BB6-4BDD-82ED-2AB495687A19.png",
          "frame" : {
            "y" : 760,
            "x" : 14,
            "width" : 613,
            "height" : 2
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 760,
          "x" : 14,
          "width" : 613,
          "height" : 2
        },
        "name" : "Divider"
      },
      {
        "maskFrame" : null,
        "id" : "DEA47C09-41EB-482E-B6E7-548A4D71C685",
        "visible" : true,
        "children" : [
          {
            "maskFrame" : null,
            "id" : "71E3FB1C-C008-44E4-BD4D-BB19E840DAE2",
            "visible" : true,
            "children" : [

            ],
            "image" : {
              "path" : "images\/Rectangle_49__Rectangle_50-71E3FB1C-C008-44E4-BD4D-BB19E840DAE2.png",
              "frame" : {
                "y" : 888,
                "x" : 298,
                "width" : 45,
                "height" : 64
              }
            },
            "imageType" : "png",
            "layerFrame" : {
              "y" : 888,
              "x" : 298,
              "width" : 45,
              "height" : 64
            },
            "name" : "Rectangle_49__Rectangle_50"
          }
        ],
        "image" : {
          "path" : "images\/PauseBtn-DEA47C09-41EB-482E-B6E7-548A4D71C685.png",
          "frame" : {
            "y" : 832,
            "x" : 232,
            "width" : 176,
            "height" : 176
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 832,
          "x" : 232,
          "width" : 176,
          "height" : 176
        },
        "name" : "PauseBtn"
      },
      {
        "maskFrame" : null,
        "id" : "D8EAAE7D-1B27-4052-9F08-2F7EBCA2783A",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/ContentShare-D8EAAE7D-1B27-4052-9F08-2F7EBCA2783A.png",
          "frame" : {
            "y" : 1054,
            "x" : 299,
            "width" : 42,
            "height" : 58
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 1054,
          "x" : 299,
          "width" : 42,
          "height" : 58
        },
        "name" : "ContentShare"
      },
      {
        "maskFrame" : null,
        "id" : "1DCA311C-5B24-43EE-932D-C9A663C86A2F",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/ShowTile-1DCA311C-5B24-43EE-932D-C9A663C86A2F.png",
          "frame" : {
            "y" : 0,
            "x" : 0,
            "width" : 640,
            "height" : 1136
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 0,
          "x" : 0,
          "width" : 640,
          "height" : 1136
        },
        "name" : "ShowTile"
      },
      {
        "maskFrame" : null,
        "id" : "B27B1F32-9969-47A2-BC15-51406286A6A0",
        "visible" : true,
        "children" : [

        ],
        "image" : {
          "path" : "images\/ShowTile2-B27B1F32-9969-47A2-BC15-51406286A6A0.png",
          "frame" : {
            "y" : 0,
            "x" : 0,
            "width" : 640,
            "height" : 1136
          }
        },
        "imageType" : "png",
        "layerFrame" : {
          "y" : 0,
          "x" : 0,
          "width" : 640,
          "height" : 1136
        },
        "name" : "ShowTile2"
      }
    ],
    "image" : {
      "path" : "images\/Segment_Player__Program_Episode-A7353614-C71A-4BF4-BDC3-42F5A2B40614.png",
      "frame" : {
        "y" : 0,
        "x" : 0,
        "width" : 640,
        "height" : 1136
      }
    },
    "imageType" : "png",
    "layerFrame" : {
      "y" : 0,
      "x" : 0,
      "width" : 640,
      "height" : 1136
    },
    "name" : "Segment_Player__Program_Episode"
  }
]
window.Framer.Defaults.DeviceView = {
  "deviceScale" : -1,
  "orientation" : 0,
  "contentScale" : 1,
  "deviceType" : "iphone-5s-silver"
};

window.FramerStudioInfo = {
  "deviceImagesUrl" : "file:\/\/\/Applications\/Framer%20Studio.app\/Contents\/Resources\/DeviceImages\/"
};

Framer.Device = new Framer.DeviceView();
Framer.Device.setupContext();