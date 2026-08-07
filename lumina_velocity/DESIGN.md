---
name: Lumina Velocity
colors:
  surface: '#121414'
  surface-dim: '#121414'
  surface-bright: '#37393a'
  surface-container-lowest: '#0c0f0f'
  surface-container-low: '#1a1c1c'
  surface-container: '#1e2020'
  surface-container-high: '#282a2b'
  surface-container-highest: '#333535'
  on-surface: '#e2e2e2'
  on-surface-variant: '#c4c5d9'
  inverse-surface: '#e2e2e2'
  inverse-on-surface: '#2f3131'
  outline: '#8e90a2'
  outline-variant: '#434656'
  surface-tint: '#b8c3ff'
  primary: '#b8c3ff'
  on-primary: '#002388'
  primary-container: '#2e5bff'
  on-primary-container: '#efefff'
  inverse-primary: '#124af0'
  secondary: '#c8c6c5'
  on-secondary: '#313030'
  secondary-container: '#4a4949'
  on-secondary-container: '#bab8b7'
  tertiary: '#c8c6c5'
  on-tertiary: '#303030'
  tertiary-container: '#6e6d6d'
  on-tertiary-container: '#f3f0ef'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#dde1ff'
  primary-fixed-dim: '#b8c3ff'
  on-primary-fixed: '#001356'
  on-primary-fixed-variant: '#0035be'
  secondary-fixed: '#e5e2e1'
  secondary-fixed-dim: '#c8c6c5'
  on-secondary-fixed: '#1c1b1b'
  on-secondary-fixed-variant: '#474646'
  tertiary-fixed: '#e5e2e1'
  tertiary-fixed-dim: '#c8c6c5'
  on-tertiary-fixed: '#1b1b1c'
  on-tertiary-fixed-variant: '#474746'
  background: '#121414'
  on-background: '#e2e2e2'
  surface-variant: '#333535'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  title-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-bold:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.05em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  unit: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  gutter: 16px
  margin-mobile: 20px
  bottom-sheet-peak: 280px
---

## Brand & Style

The design system is engineered for a high-performance ride-hailing experience that prioritizes speed, reliability, and nocturnal clarity. The aesthetic is rooted in **Minimalism** with a heavy emphasis on **High-Contrast** elements to ensure legibility in high-glare or low-light environments. 

The brand personality is precise and modern, utilizing deep obsidian surfaces to let functional "Electric Blue" actions stand out. The interface should feel like a premium digital cockpit—uncluttered, responsive, and authoritative. Space is used intentionally to reduce cognitive load during the high-intent moments of booking and tracking a ride.

## Colors

The palette is strictly dark-mode to reduce eye strain and preserve battery on OLED mobile devices. 

- **Primary (Electric Blue):** Used exclusively for high-priority interactive elements like "Request Ride" buttons, active route paths on the map, and selection states.
- **Background (Deep Charcoal):** The base layer of the application. It provides the canvas for the entire experience.
- **Surface (Dark Grey):** Used for elevated containers such as bottom sheets, cards, and input fields. This creates a clear visual distinction from the map and background.
- **Typography/Icons:** Pure white (#FFFFFF) for maximum contrast against dark backgrounds, with secondary text utilizing a 60% opacity of white.

## Typography

This design system uses **Inter** for its exceptional legibility and systematic feel. The type scale is optimized for quick scanning.

- **Headlines:** Use Bold weights with slight negative letter-spacing to create a compact, modern feel.
- **Body:** Use Regular weights for descriptions and addresses to ensure maximum readability.
- **Labels:** Use uppercase for small metadata (e.g., license plate numbers, estimated time of arrival) to differentiate them from interactive body text.
- **Map Labels:** Use semi-bold weights with a subtle outer glow or halo to ensure they remain visible over varied map textures.

## Layout & Spacing

The layout is designed for one-handed mobile use. The map serves as the persistent global background, with UI elements floating or anchored to the bottom.

- **Grid:** A fluid grid with 20px side margins on mobile. 
- **Bottom Anchoring:** Primary interactions (Search, Ride Selection) are housed in bottom sheets to keep them within the "thumb zone."
- **Touch Targets:** All interactive elements must maintain a minimum 48x48px hit area.
- **Spacing Rhythm:** A 4px baseline grid ensures vertical consistency across lists and forms.

## Elevation & Depth

Visual hierarchy is achieved through **Tonal Layering** and **Ambient Shadows**.

1. **Level 0 (Map/Background):** The deepest layer.
2. **Level 1 (Cards/Inputs):** Surface color (#1E1E1E) with no shadow, but a subtle 1px border (#2C2C2C) to define edges.
3. **Level 2 (Bottom Sheets/Modals):** Surface color (#1E1E1E) with a large, diffused black shadow (0px 8px 24px rgba(0,0,0,0.5)) to create separation from the map.
4. **Active State:** The Electric Blue primary color acts as a functional "glow" for active selections.

## Shapes

The shape language uses **Rounded** (0.5rem / 8px) to **Extra Large** (1rem / 16px) corners to balance the "fast" tech aesthetic with a friendly, approachable feel.

- **Buttons & Inputs:** 12px corner radius for a modern, tactile look.
- **Bottom Sheets:** 24px top-only corner radius to create a soft "drawer" appearance.
- **Chips:** Fully pill-shaped (32px+) for status indicators and quick-filter options.

## Components

### Buttons
- **Primary:** Electric Blue fill with White text. Bold weight. No border.
- **Secondary:** Dark Grey (#1E1E1E) fill with a 1px border (#2E5BFF).
- **Ghost:** No fill, White text, used for less urgent actions like "Cancel" or "Add Stop."

### Bottom Sheets
The core container for the ride-hailing flow. It features a grab handle at the top (40x4px, 50% opacity white). It should support multiple snap points (collapsed, halfway, expanded).

### Input Fields
Dark Grey (#1E1E1E) fill with a subtle 1px border. On focus, the border transitions to Electric Blue. Icons (e.g., search magnifying glass) should be placed on the left, while clear buttons appear on the right.

### Ride Selection Cards
Horizontal layout. Vehicle illustration on the left, Title and Capacity in the center, Price and ETA on the right. When selected, the card gains an Electric Blue border.

### Status Chips
Used for "Economy," "Premium," or "Discounts." Use semi-transparent backgrounds with high-contrast text to keep the map visible behind them when floating.

### Map Markers
The "Pickup" marker is a solid white circle with an Electric Blue dot in the center. The "Destination" marker is a solid Electric Blue pin. The route line is a 4px wide Electric Blue stroke with a slight outer glow.