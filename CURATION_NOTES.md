# Curation notes — known gaps and bad entries

Running log of data-availability gaps and known-bad curated entries, so they
aren't mistaken for complete/correct data. Surfaced during the jetscape-analysis
observable-encoding migration (see `JETSCAPE-analysis/MIGRATION_NOTES.md`).

## 5020 (Pb-Pb 5.02 TeV)

### Missing / not yet curated (`hepdata: N/A` in `config/STAT_5020.yaml`)

These observables have **no curated HEPData** here — not present under
`data/5020/...` and not registered in `hepdata_database.yaml`:

| Observable | Inspire | Note |
|---|---|---|
| `inclusive_jet/pt_small_R_atlas` | 2623088 | not curated |
| `inclusive_jet/rg_atlas` | 2512925 | not curated |
| `inclusive_jet/d12_atlas` | 2623088 | not curated; config marked `# TODO: Update` |
| `inclusive_jet/dR12_atlas` | 2909617 | not curated; config marked `# TODO: Update` |
| `dijet_trigger_jet/pt_pair_atlas` | 2811406 (arXiv 2407.18796) | not curated — see bad entry below |
| `dijet_trigger_jet/xj_atlas` | 2811406 (arXiv 2407.18796) | not curated — see bad entry below |
| `dijet_trigger_jet/yield_atlas` | 2811406 (arXiv 2407.18796) | not curated — see bad entry below |

### Known-bad entries (curated but WRONG — to delete/replace)

**`data/5020/dijet_trigger_jet/{pt_pair_atlas,xj_atlas,yield_atlas}/`** — each
contains a `HEPData-ins2165916-v1-yaml/` dir that is a **byte-identical copy of
the CMS `ins2165916` payload** (CMS HIN-21-002, dijet v₂/v₃/v₄). That is the
wrong measurement: these three slots are meant to hold the **ATLAS** dijet
radius-dependence measurement (R_AA^pair, x_j, dijet yield), inspire **2811406**
(arXiv 2407.18796), which is **not yet curated**.

Action: delete these three stub dirs (and their `hepdata_database.yaml` entries)
and re-curate from the real ATLAS 2811406 record when available. The config in
jetscape-analysis no longer references them (its `inspire_hep` now points at
2811406 with `hepdata: N/A`).

Only `dijet_trigger_jet/v2_cms/HEPData-ins2165916-v1-yaml/` legitimately matches
`ins2165916`.

### Curated and correct, but unused (context — not a curation gap)

These have correct curated data; they are disabled in the analysis only because
the analyzer code isn't available yet (not a curation issue):
- `dijet_trigger_jet/v2_cms` — ins2165916 (CMS dijet v₂/v₃/v₄).
- `inclusive_jet/eec_cms` — ins2904406-v2.

### Step 5 split — new registry aliases (2026-06-03)

The analysis Step 5 split `mass_alice` → `mass_alice` (ungroomed) + `mg_alice` (groomed) and
`angularity_alice` → `angularity_alice` (ungroomed) + `angularity_groomed_alice` (groomed). Two
**alias** entries were added to `hepdata_database.yaml` so the new (groomed) observable names resolve:

| New key | `directory:` aliases (existing records, no new files) |
|---|---|
| `5020/inclusive_chjet/mg_alice` | `5020/inclusive_chjet/mass_alice/HEPData-ins2845788-v1-yaml` |
| `5020/inclusive_chjet/angularity_groomed_alice` | `5020/inclusive_chjet/angularity_alice/HEPData-ins1891385-v1-yaml` (pp) + `.../HEPData-ins2845788-v1-yaml` (AA) |

These reuse the sibling observable's HEPData payload (the same paper holds both the ungroomed and
groomed tables); the analysis config selects the SD z_cut=0.2 groomed tables. No new HEPData files
were added. **If these records are ever re-curated into per-observable directories, update both the
ungroomed and the groomed alias together.** Note: ALICE jet mass/angularity report no PbPb/pp *ratio*
in HEPData, so the analysis computes R_AA itself from the spectra (config comment in STAT_5020.yaml).
