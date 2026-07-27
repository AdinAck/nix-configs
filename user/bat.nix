{
  programs.bat = {
    enable = true;
    config = {
      theme = "Graphene";
    };
  };

  xdg.configFile."bat/themes/Graphene.tmTheme".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>name</key>
        <string>Graphene</string>
        <key>settings</key>
        <array>
            <!-- Global Editor Colors -->
            <dict>
                <key>settings</key>
                <dict>
                    <key>background</key>
                    <string>#1e1e1e</string>
                    <key>foreground</key>
                    <string>#d4d4d4</string>
                    <key>caret</key>
                    <string>#808080</string>
                    <key>selection</key>
                    <string>#404040</string>
                </dict>
            </dict>
            <!-- Keywords and Logic (impl, let, for, pub, in, as) -->
            <dict>
                <key>scope</key>
                <string>keyword, keyword.control, keyword.operator.word, keyword.other, keyword.declaration, storage, storage.type, storage.modifier</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#fb4833</string>
                </dict>
            </dict>
            <!-- Operators (References, Math) - Overrides Keyword -->
            <dict>
                <key>scope</key>
                <string>keyword.operator, punctuation.separator</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#8e8e8e</string>
                </dict>
            </dict>
            <!-- Functions and Macros -->
            <dict>
                <key>scope</key>
                <string>entity.name.function, support.function, meta.function-call, entity.name.macro, support.macro, entity.name.function.macro, support.function.macro</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#fbcb00</string>
                </dict>
            </dict>
            <!-- Types, Structs, Enums, Traits -->
            <dict>
                <key>scope</key>
                <string>entity.name.type, entity.name.class, support.type, support.class, entity.name.namespace, entity.name.trait, entity.name.struct, entity.name.enum</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#fabd2e</string>
                </dict>
            </dict>
            <!-- Enum Variants, Constants, and Self -->
            <dict>
                <key>scope</key>
                <string>constant.other, variable.other.constant, variable.other.enumvariant, entity.name.enum.variant, support.constant, variable.other.member, variable.language.self, support.type.self</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#fa9d0e</string>
                </dict>
            </dict>
            <!-- Strings -->
            <dict>
                <key>scope</key>
                <string>string</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#98bb05</string>
                </dict>
            </dict>
            <!-- Numbers, Booleans, and Lifetimes -->
            <dict>
                <key>scope</key>
                <string>constant.numeric, constant.language, storage.modifier.lifetime, punctuation.definition.lifetime, entity.name.type.lifetime</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#d3869b</string>
                </dict>
            </dict>
            <!-- Comments -->
            <dict>
                <key>scope</key>
                <string>comment</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#808080</string>
                </dict>
            </dict>
            <!-- Variables -->
            <dict>
                <key>scope</key>
                <string>variable, support.variable</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>#d0d0d0</string>
                </dict>
            </dict>
        </array>
    </dict>
    </plist>
  '';
}
