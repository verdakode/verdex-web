import React from 'react'
import { createRoot } from 'react-dom/client'
import Homepage from '../components/Homepage'
import '../stylesheets/style.css'
import '../stylesheets/responsive.css'
import './main.js'

document.addEventListener('DOMContentLoaded', () => {
  const rootElement = document.getElementById('react-root')
  if (rootElement) {
    const root = createRoot(rootElement)
    root.render(<React.StrictMode><Homepage /></React.StrictMode>)
  }
})
