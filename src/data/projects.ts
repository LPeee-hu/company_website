// src/data/projects.ts – a projektoldalak regisztere; új termék = új bejegyzés ide
import type { ProjectData } from './project';
import { myrate } from './myrate';

export const projects: Record<string, ProjectData> = { myrate };
