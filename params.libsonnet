local env = std.extVar('qbec.io/env');
local base = import './environments/base.libsonnet';
local default = import './environments/default.libsonnet';
local stage = import './environments/stage.libsonnet';
local production = import './environments/production.libsonnet';

local paramsMap = {
  _: base,
  default: default,
  stage: stage,
  production: production,
};

if std.objectHas(paramsMap, env) then paramsMap[env] else error 'environment ' + env + ' not defined in ' + std.thisFile
