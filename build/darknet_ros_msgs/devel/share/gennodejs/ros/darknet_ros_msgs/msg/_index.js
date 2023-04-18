
"use strict";

let BoundingBoxes = require('./BoundingBoxes.js');
let ObjectCount = require('./ObjectCount.js');
let BoundingBox = require('./BoundingBox.js');
let CheckForObjectsResult = require('./CheckForObjectsResult.js');
let CheckForObjectsAction = require('./CheckForObjectsAction.js');
let CheckForObjectsActionResult = require('./CheckForObjectsActionResult.js');
let CheckForObjectsGoal = require('./CheckForObjectsGoal.js');
let CheckForObjectsActionGoal = require('./CheckForObjectsActionGoal.js');
let CheckForObjectsFeedback = require('./CheckForObjectsFeedback.js');
let CheckForObjectsActionFeedback = require('./CheckForObjectsActionFeedback.js');

module.exports = {
  BoundingBoxes: BoundingBoxes,
  ObjectCount: ObjectCount,
  BoundingBox: BoundingBox,
  CheckForObjectsResult: CheckForObjectsResult,
  CheckForObjectsAction: CheckForObjectsAction,
  CheckForObjectsActionResult: CheckForObjectsActionResult,
  CheckForObjectsGoal: CheckForObjectsGoal,
  CheckForObjectsActionGoal: CheckForObjectsActionGoal,
  CheckForObjectsFeedback: CheckForObjectsFeedback,
  CheckForObjectsActionFeedback: CheckForObjectsActionFeedback,
};
