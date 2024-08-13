import { HttpFunction } from "@google-cloud/functions-framework";

export const main: HttpFunction = async (req, res) => {
  return res.send("Hello, World!");
};
