module Lita
  module Handlers
    # Public: Generate a buzzword filled business phrase drawn from the WSJ's
    # buzzword generator.
    #
    # http://projects.wsj.com/buzzwords2014
    class WsjBusinessBuzzwordGenerator < Handler
      THE_PHRASES = [
        'Looking forward to 2014, **NOUN** will be key to our ability to **VERB** the **NOUN** **ADVERB**.',
        'This product will **VERB** **NOUN** and demonstrate **ADJ** performance in **NOUN**.',
        'We need to move now. Our competitors already **VERB** **ADJ** **NOUN**.',
        '**VERB** the **NOUN** **ADVERB**. **BSE**.',
        '**BSE_START**, the marketplace has changed. **VERB** **ADVERB** or **VERB**.',
        'If we **VERB**, we will unfortunately be lagging in **ADJ** **NOUN**.',
        'People, in the coming year, we need to **ADVERB** **VERB** our **NOUN**.',
        '**BSE_START**, it\'s time to act with **ADJ** **NOUN** and **VERB** our team **NOUN**.',
        'Our **NOUN** is the most **ADJ** thing at our company. Do your best to **VERB** it.',
        'All: Please note the new policy -- Starting next calendar year, we will **VERB** on **ADJ** **NOUN**. **BSE**.',
        'I\'m disappointed in the way we **VERB** our **NOUN**. Let\'s please **VERB** our efforts.',
        'Our **NOUN** center is focused on new ways to **VERB** the consumer space through **ADJ** deployments of **NOUN**.',
        'The tax-and-accounting department has issues with the **ADJ** way you **ADVERB** treated this **ADJ** transaction.',
        'As part of our review of **NOUN**, we have decided to move forward with **ADJ** **NOUN**. **BSE**.',
        'Your colleagues are increasingly **ADJ**, so it\'s important that we **VERB** accordingly.',
        'If the challenges persist, we should immediately **VERB**.',
        'Next quarter we will launch our new **NOUN**-killer which will **VERB** the **NOUN** **ADVERB**.',
        'This sector has **ADJ** **NOUN**. **BSE**.',
        'Our team leader just gave us a **ADJ** pep talk.',
        'The boss gathered the managers for an emergency meeting and said **ADJ** **NOUN**. **BSE**.',
        'My co-workers have been **ADJ** **NOUN** since the reorganization.',
      ]
      NOUNS = [
        'agility',
        'alignment',
        'alpha',
        'bandwidth',
        'Big Data',
        'boots on the ground',
        'brand',
        'the cloud',
        'change agent',
        'community',
        'content marketing',
        'corporate social responsibility',
        'deep dive',
        'early adopter',
        'ecosystem',
        'enterprise',
        'face time',
        'footprint',
        'game-changer',
        'horizontal management structure',
        'ideation',
        'incubator',
        'industry',
        'innovation',
        'IP',
        'learnings',
        'low-hanging fruit',
        'mindshare',
        'minimum viable product',
        'narrative',
        'native advertising',
        'onboarding',
        'optics',
        'paradigms',
        'passion',
        'playing field',
        'ROI',
        'skillsets',
        'solutions',
        'sustainability',
        'synergy',
        'thought leaders',
        'tipping point',
        'traction',
        'transformation',
        'value add',
        'vector',
        'visibility',
        'wheelhouse',
      ]
      BSE_STARTS = [
        'At the end of the day',
        'Going forward',
        'Moving forward',
      ]
      BSES = [
        'It is what it is',
        'Yolo',
        'Skate to where the puck is going to be',
      ]
      VERBS = [
        'aggregate',
        'amortize',
        'benchmark',
        'circle back',
        'close the loop',
        'cross-pollinate',
        'curate',
        'dialog',
        'disrupt',
        'drill down',
        'drive',
        'empower',
        'future-proof',
        'gamify',
        'ideate',
        'impact',
        'incentivize',
        'innovate',
        'leverage',
        'monetize',
        'move the needle',
        'open the kimono',
        'piggyback',
        'pivot',
        'push the envelope',
        'quantify',
        're-imagine',
        'reach out',
        'recontextualize',
        'roll out',
        'silo',
        'streamline',
        'synthesize',
        'taper',
        'tee up',
        'transform',
        'unpack',
        'vertically integrate',
      ]
      ADJECTIVES = [
        '24/7',
        'agile',
        'amazing',
        'artisanal',
        'authentic',
        'bleeding-edge',
        'cloud-based',
        'cutting-edge',
        'disruptive',
        'dynamic',
        'entrepreneurial',
        'epic',
        'epic',
        'frictionless',
        'game-changing',
        'granular',
        'high level',
        'iconic',
        'innovative',
        'intuitive',
        'meta',
        'multiplatform',
        'organic',
        'out of the box',
        'passionate',
        'pro-active',
        'proven',
        'robust',
        'robust',
        'social',
        'strategic',
        'sustainable',
        'turnkey',
        'ultimate',
        'value-added',
        'vertical',
        'viral',
        'win-win',
        'world-class',
      ]
      ADVERBS = %w(
        holistically
        literally
        strategically
        organically
        vertically
        horizontally
      )

      route(/^buzzword$/,
            :buzzword,
            command: true,
            help: {
              'buzzword' => 'Give us a business phrase filled with buzzwords.'
            },
           )

      def buzzword(response)
        response.reply business_speak
      end

      private

      def business_speak
        THE_PHRASES.sample.gsub(/\*\*(NOUN|VERB|ADJ|ADVERB|BSE|BSE_START)\*\*/) { |_|
          self.class.const_get("#{$1}S").sample
        }
      end

      Lita.register_handler(self)
    end
  end
end
