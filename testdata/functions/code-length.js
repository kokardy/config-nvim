import { createRulesetFunction } from '@stoplight/spectral-core';

export default createRulesetFunction(
  {
    input: null,
    options: null
  },

  (code, _, context) => {

    // console.log(code);
    if ("type" in code && code.type !== "string"){
      return [
        {
          message: `code must be string`
        },
      ];

    }

    if ('minLength' in code && 'maxLength' in code) {
      return;
    }

    if ('pattern' in code) {
      const pattern = code.pattern;
      const matcher = /^\^\[0-9\]\{[0-9]*\}\$/
      if (pattern.match(matcher)) {
        return;
      }
    return [
      {
        message: `${context.path.join(
          '.',
        )}:code pattern must be '^[0-9]{\d}$'`,
      },
    ];
    }

    return [
      {
        message: `code must have (minLength, maxLength) or pattern`,
      },
    ];
  },
);
