(ns frontend.core
  (:require [secretary.core :as secretary :include-macros true :refer [defroute]]
            [goog.events :as events]
						[reagent.core :as reagent :refer [atom]])
  (:import goog.History
           goog.history.EventType))

(secretary/set-config! :prefix "#")

(defn get-app-root []
	(.getElementById js/document "app"))

;; /#/  -- home

(defn home-component []
  [:div
   [:h1 "You are home"]])

(defroute home-path "/" []
  (reagent/render-component [home-component] (get-app-root)))

;; /#/button

(def click-count (atom 0))

(defn counting-component []
  [:div
   "The atom " [:code "click-count"] " has value: " @click-count ". "
   [:input {:type "button" :value "Click me!"
            :on-click #(swap! click-count inc)}]])

(defroute home-path "/button" []
	(reagent/render-component [counting-component] (get-app-root)))

;; Catch all

(defn defualt-component []
  [:div
   [:h1 "This is not the page you are looking for"]])

(defroute "*" []
  (reagent/render-component [defualt-component] (get-app-root)))

;; Quick and dirty history configuration.
(let [h (History.)]
  (goog.events/listen h EventType.NAVIGATE #(secretary/dispatch! (.-token %)))
  (doto h
    (.setEnabled true)))
