import React from "react";
import {
  Box,
  H5,
  Icon,
  Illustration,
  IllustrationProps,
  Text,
} from "@adminjs/design-system";
import { styled } from "@adminjs/design-system/styled-components";

const boxes = () => [
  {
    variant: "Moon",
    title: "Czas trwania badania",
    subtitle:
      "Ustaw początkową i końcową datę, kiedy uczestnicy badania mogą wypełniać formularz snu.",
  },
  {
    variant: "Docs",
    title: "Lista uczestników",
    subtitle: `Dodaj maile uczestników badania, którzy mają uprawnienia wypełniać formularz snu w aplikacji mobilnej.`,
  },
  {
    variant: "Clip",
    title: "Przeglądaj odpowiedzi",
    subtitle:
      "Przeglądaj odpowiedzi na formularz snu wraz z ich szczegółami. Polecamy jednak opcję eksportu do excela.",
  },
];

const Card = styled(Box)`
  display: ${({ flex }): string => (flex ? "flex" : "block")};
  color: ${({ theme }) => theme.colors.grey100};
  height: 100%;
  text-decoration: none;
  border: 1px solid transparent;
  border-radius: ${({ theme }) => theme.space.md};
  transition: all 0.1s ease-in;
  &:hover {
    border: 1px solid ${({ theme }) => theme.colors.primary100};
    box-shadow: ${({ theme }) => theme.shadows.cardHover};
  }
`;

const defaultProps = { variant: "container", boxShadow: "card" };

export const Dashboard: React.FC = () => {
  return (
    <Box
      mt={["xl", "xl"]}
      mb="xl"
      mx={[0, 0, 0, "auto"]}
      px={["default", "lg", "xxl", "0"]}
      position="relative"
      flex
      flexDirection="row"
      flexWrap="wrap"
      width={[1, 1, 1, 1024]}
    >
      {boxes().map((box, index) => (
        <Box key={index} width={[1, 1 / 2, 1 / 2, 1 / 3]} p="lg">
          <Card {...defaultProps} target="_blank">
            <Text textAlign="center">
              <Illustration
                variant={box.variant as IllustrationProps["variant"]}
                width={100}
                height={70}
              />
              <H5 mt="lg">{box.title}</H5>
              <Text>{box.subtitle}</Text>
            </Text>
          </Card>
        </Box>
      ))}

      <Box width={[1, 1, 1]} p="lg">
        <Card
          {...defaultProps}
          as="a"
          flex
          href="https://github.com/serverpod/serverpod/issues"
          target="_blank"
        >
          <Box flexShrink={0}>
            <Icon icon="Download" size="64" />
          </Box>
          <Box ml="xl">
            <H5>{"Excel Eksport "}</H5>
            <Text>
              {
                "Wyeksportuj wysłane odpowiedzi do excela, wraz z wyliczonymi polami."
              }
            </Text>
          </Box>
        </Card>
      </Box>
    </Box>
  );
};

export default Dashboard;
