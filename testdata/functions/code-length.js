import { createRulesetFunction } from "@stoplight/spectral-core";

export default createRulesetFunction(
  {
    input: null,
    options: {
      type: "object",
      additionalProperties: false,
      properties: {
        value: true
      },
      required: ["value"],
    },
  },
  (targetVal, options, context) => {
    const {value} = options;
    const code = targetVal.code


    if ("minLength" in code && "maxLength" in code){
      console.log("minLength, maxLength exists")
      return
    }

    if ("pattern" in code){
      console.log("pattern exists")
      return
    }

    return [
      {
        message: `${context.path.join(".")}:code must have (minLength, maxLength) or pattern`,
      },
    ];
  },
);
