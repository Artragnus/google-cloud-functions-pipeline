import { HttpFunction } from "@google-cloud/functions-framework";

export const main: HttpFunction = async (req, res) => {
  console.log(process.env.TOKEN);
  return res.send("Hello, World!");
};
