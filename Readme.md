#Tamaños por defecto. 

Toda **UIView** tine una **propiedad** llamada **intrinsicContentSize** que retorna un **CGRect** con el tamñana por defecto que posee esta _vista_. En general este tamaño viene dado por su _contenido_ 

	self.view.intrinsicContentSize
	
	NSLog(@"View Size... %@",NSStringFromCGSize(self.view1.intrinsicContentSize));
	
	NSLog(@"Label Size.... %@",NSStringFromCGSize(self.label.intrinsicContentSize));
	

![](https://developer.apple.com/reference/appkit/nsview/1526996-intrinsiccontentsize?language=objc)

Se puede sobreescribir esta propiedad **intrinsicContentSize** de la **UIView** pero al momento en que cambie se deberia de llamar **invalidateIntrinsicContentSize** para que el Auto Layout recalcule su nuevo tamaño. 


Para poder indicar la resistencia a cambiar el tamaño por defecto de una vista, tenemos 2 propiedades:

- _contentCompressionResistancePriority_: Resistir la reducción del tamaño y se dara cuando su prioridad sea mayor que la restricción que intenta que intenta comprimirla. 

- _contentHuggingPriority_: Hace lo contrario 


#Prioridades

La **prioridad** es un _float_ con valores entre **1000** _(required)_ y **1**.

	enum {
	   UILayoutPriorityRequired = 1000,         // required
	   UILayoutPriorityDefaultHigh = 750,       // compression resistance
	   UILayoutPriorityDefaultLow = 250,        // content hugging
	   UILayoutPriorityFittingSizeLevel = 50,   // system layout fitting size
	};
	typedef float UILayoutPriority;
	

#Atributos
- Posición: **NSLayoutAttribute[_Left_/_Right_/_Top_/_Bottom_]**
- Márgenes: **NSLayoutAttributeLeading** o **NSLayoutAttributeTrailing** indican el espacio antes o después de la vista. Esto depende de la _locale_.
- Tamaño: **NSLayoutAttributeWidth** y **NSLayoutAttributeHeight**
- Centro: **NSLayoutAttributeCenterX** y **NSLayoutAttributeCenterY**
- Linea de texto: **NSLayoutAtrributeBaseline** indica la distancia desde la base de la vista, a partir de la cual se empieza a dibujar texto.
- Nulo: **NSLayoutAttributeNotAnAttribute** es el atributo nulo, para cuando hace falta un _placeholder_.
- Relación lógica: **NSLayoutRelationLessThanOrEqual**, **NSLayoutRelationEqual**, **NSLayoutRelationGreaterThanOrEqual**

#AutoLayout por Código

Para esto necesitamos crear _instancias_ de **NSLayoutConstraint**

Creamos un boton. 

    UIButton *centered = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 
 Lo centramos.
	 
	 // Asigna intrinsicContentSize y me ahorra asignar una restricción de ancho
    [centered setTitle:@"Don't tap this!" forState:UIControlStateNormal];
    
Agregamos a la vista. 

	 [self.view addSubview:centered];
	 
Desactivamos las restricciones de posición fija.

	centered.translatesAutoresizingMaskIntoConstraints = NO;
	
Agregamos las restricciones. 

	 NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.view
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:centered
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1
                                                                constant:0];
                                                                
	NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:self.view
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:centered
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1
                                                                constant:0];
                                                                
Los añadimos (siempre al primer antepasado común)
	
	[self.view addConstraints:@[centerX, centerY]];
	
Comprobamos que todo está bien
	
	NSAssert(!centered.hasAmbiguousLayout, @"The layout is ambiguous!");
	

Documentación.
![](http://matthewmorey.com/creating-uiviews-programmatically-with-auto-layout/)










