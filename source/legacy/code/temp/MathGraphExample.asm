org 500h

PROGRAM:

call MathGraph_Methods__Raymarching_CreateRay

jmp PROGRAM

MathGraph_VIDEO__Set_Pixel:
	; Вычисляем адрес для пикселя
	; Адрес = y * ширина_экрана + x
	; в режиме 13h ширина экрана = 320
	push ax              ; сохраняем AX в стек
	mov cx, 320          ; ширина экрана
	mul dx               ; умножаем Y на ширину экрана
	add ax, bx           ; добавляем X
	mov di, ax           ; сохраняем адрес в DI
	pop ax               ; возвращаем AX из стека

	mov [es:di], al      ; устанавливаем пиксель
	ret

MathGraph_Methods__Raymarching_CreateRay: ; INPUT: AX - 

	ret

MathGraph_MathFunc__Raymarching_getDistance:
    RAY_POINT
	ret

;===== MathGraph  Variables =====;
DISTANCE_TO_OBJECT DB 0
RAY_POINT DB 0

;================================;
;=========== OBJECTS ============;
;================================;

;========== Sphere ==========;

;--Position:
SphereObj1__pos_X DB 0
SphereObj1__pos_Y DB 0
SphereObj1__pos_Z DB 2

;--Rotation:
SphereObj1__rot_X DB 0
SphereObj1__rot_Y DB 0
SphereObj1__rot_Z DB 0

;--Color:
SphereObj1__color_Red db 1
SphereObj1__color_Green db 1
SphereObj1__color_Blue db 1

;--Property:
SphereObj1__prop_RADIUS DB 1


;============================;

;========== Camera ==========;

;--Position:
CameraObj1__pos_X DB 0
CameraObj1__pos_Y DB 0
CameraObj1__pos_Z DB 0

;--Rotation:
CameraObj1__rot_X DB 0
CameraObj1__rot_Y DB 0
CameraObj1__rot_Z DB 0

;--Property:
CameraObj1__prop_DrawDistance DB 10

;============================;