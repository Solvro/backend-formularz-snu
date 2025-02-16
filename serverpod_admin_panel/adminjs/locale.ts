import { CurrentAdmin, Locale } from "adminjs";

export const locale:
  | Locale
  | ((admin?: CurrentAdmin) => Locale | Promise<Locale>) = {
  language: "en",
  translations: {
    en: {
      components: {
        Login: {
          welcomeHeader: "Elo żelo!",
          welcomeMessage:
            "Witamy w panelu administracyjnym Formularza Snu Solvro",
        },
      },
      labels: {
        participants: "Uczestnicy badania",
      },
    },
  },
};
