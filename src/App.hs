module App (appMain) where

import ClassyPrelude hiding (join)
import Reflex.Dom (MonadWidget, el, mainWidget, text)

appMain :: IO ()
appMain = mainWidget appWidget

appWidget :: forall t m. MonadWidget t m => m ()
appWidget = do
  el "h2" $ text "Hi!"
