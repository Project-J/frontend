(ns frontend.core
  (:require [clojure.string :as string]
            [reagent.core :as reagent :refer [atom]]))

(enable-console-print!)

(def click-count (atom 0))

(defn counting-component []
  [:div
   "The atom " [:code "click-count"] " has value: "
   @click-count ". "
   [:input {:type "button" :value "Click me!"
            :on-click #(swap! click-count inc)}]])

(reagent/render-component [counting-component] (.getElementById js/document "app"))

